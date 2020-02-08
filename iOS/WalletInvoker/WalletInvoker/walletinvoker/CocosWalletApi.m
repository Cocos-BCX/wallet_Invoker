//
//  CocosWalletApi.m
//  WalletInvoker
//
//  Created by 邵银岭 on 2020/1/7.
//  Copyright © 2020 邵银岭. All rights reserved.
//

#import "CocosWalletApi.h"
#import "CocosRequestObj+Private.h"

static const NSString *kReqRespParam  = @"param";

static NSString *appid_for_cocos = nil;
static NSString *callback_schema = nil;

@implementation CocosWalletApi

+ (void)registerAppID:(NSString *)appID {
    appid_for_cocos = appID;
}

/**  发起请求 */
+ (BOOL)sendObj:(CocosRequestObj *)obj {
    if (obj.callbackSchema.length){
      callback_schema = obj.callbackSchema;
    } else{
      obj.callbackSchema = [NSString stringWithFormat:@"%@://cocosapi/?%@", appid_for_cocos,kReqRespParam];
    }
    if ([obj isKindOfClass:CocosLoginObj.class] ||
        [obj isKindOfClass:CocosTransferObj.class]||
        [obj isKindOfClass:CocosCallContractObj.class]) {
        return [self send:obj];
    }
    return NO;
}

/**  发起 */
+ (BOOL)send:(CocosRequestObj *)obj {
    CocosApiLinkObjCategoryFile();

    NSMutableDictionary *params = [obj cocos_toJSONObject].mutableCopy;
    
    if ([obj isKindOfClass:CocosLoginObj.class] ) {

    }else if ([obj isKindOfClass:CocosTransferObj.class]) {
        CocosTransferObj *transferObj = (CocosTransferObj *)obj;
        params[@"from"] = transferObj.from;
        params[@"to"] = transferObj.to;
        params[@"symbol"] = transferObj.symbol;
        params[@"amount"] = transferObj.amount;
        params[@"memo"] = transferObj.memo;
    }else if ([obj isKindOfClass:CocosCallContractObj.class]) {
        
        CocosCallContractObj *callContractObj = (CocosCallContractObj *)obj;
        params[@"param"] = callContractObj.param;
        params[@"from"] = callContractObj.from;
        params[@"contract"] = callContractObj.contract;
        params[@"method"] = callContractObj.method;

    }
    NSString *JSONString = [self toJSONString:params];
    NSString *URLString = [NSString stringWithFormat:@"CocosBCXWallet://%@?%@=%@",obj.action , kReqRespParam, JSONString];
    return [self openURLWithString:URLString];
}

/**  处理TP的回调跳转 */
+ (BOOL)handleURL:(NSURL *)url
          options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
           result:(void (^)(CocosResponseObj *))result {
    
    if ((appid_for_cocos && [url.scheme isEqualToString:appid_for_cocos]) ||
        (callback_schema && [url.absoluteString hasPrefix:callback_schema]))
    {
        CocosResponseObj *respObj = [self respObjWithURL:url];
        if (result) {
            result(respObj);
        }
        callback_schema = nil;
        return YES;
    }
    return NO;
}

#pragma mark - Private -

/**  跳转 CocosWallet App */
+ (BOOL)openURLWithString:(NSString *)URLString {
    URLString = [URLString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:URLString];
    
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        url = [NSURL URLWithString:URLString];
    } else {
        url = [NSURL URLWithString:@"https://www.cocosbcx.io/download.html"];
    }
    
    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:url options: @{} completionHandler: nil];
        return YES;
    } else {
        // Fallback on earlier versions
        return [[UIApplication sharedApplication] openURL:url];
    }
    return NO;
}


/**  解析回调url */
+ (CocosResponseObj *)respObjWithURL:(NSURL *)url {
    NSString *host = url.host ?: @"";
    NSString *query = [url.query stringByRemovingPercentEncoding] ?: @"";
    NSRange begin = [query rangeOfString:[NSString stringWithFormat:@"%@={", kReqRespParam]];
    if (begin.location == NSNotFound) {
        return nil;
    }
    NSString *JSONString = [query substringFromIndex:begin.location + begin.length - 1];
    NSData *JSONData = [JSONString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:JSONData options:0 error:nil];
    if ([dic isKindOfClass:NSDictionary.class]) {
        CocosResponseObj *respObj = CocosResponseObj.new;
        respObj.action = host;
        if ([dic objectForKey:@"result"]) {
            respObj.result = [dic[@"result"] integerValue];
        }
        if ([dic objectForKey:@"message"]) {
            respObj.message = dic[@"message"];
        }
        if ([dic objectForKey:@"data"]) {
            respObj.data = dic[@"data"];
        }
        return respObj;
    }
    return nil;
}


/**  转换成json string. */
+ (NSString *)toJSONString:(id)object {
    NSData *data = [NSJSONSerialization dataWithJSONObject:object options:0 error:NULL];
    NSString *JSONString = nil;
    if (data) JSONString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return JSONString;
}
@end
