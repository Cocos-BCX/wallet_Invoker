//
//  CocosRequestObj+Private.m
//  WalletInvoker
//
//  Created by 邵银岭 on 2020/1/7.
//  Copyright © 2020 邵银岭. All rights reserved.
//

#import "CocosRequestObj+Private.h"

void CocosApiLinkObjCategoryFile(void) {}


@implementation CocosRequestObj (Private)

- (NSDictionary *)cocos_toJSONObject {
    NSMutableDictionary *params = [NSMutableDictionary new];
    params[@"protocol"] = self.protocol;
    params[@"version"] = self.version;
    params[@"action"] = self.action;
    params[@"dappName"] = self.dappName;
    params[@"desc"] = self.desc;
    params[@"dappIcon"] = self.dappIcon;
    params[@"callbackSchema"] = self.callbackSchema;
    return params.copy;
}
@end
