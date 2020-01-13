//
//  CocosWalletApi.h
//  WalletInvoker
//
//  Created by 邵银岭 on 2020/1/7.
//  Copyright © 2020 邵银岭. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CocosRequestObj.h"
#import "CocosResponseObj.h"

NS_ASSUME_NONNULL_BEGIN

@interface CocosWalletApi : NSObject

/*!
 * @brief 注册ID
 * @param AppID a) 请确保AppID已经添加在Xcode工程info.plist-> URL types -> URL Schemes里!
 *              b) AppID也作为App回调时的URL跳转, 务必设置好AppID!
 *              c) 为了避免误操作其他App的跳转请求，请设置一个唯一的appID给TPSDK, 建议为各个SDK添加命名后缀, 如xxxfortpsdk;
 *
 * @disucss 在AppDelegate -(application:didFinishLaunchingWithOptions:)方法里注册
 */
+ (void)registerAppID:(NSString *)AppID;

/*!
 * @brief 向TP发起请求
 * @param obj 接收SDK内TPReqObj的业务子类, 如交易/转账TPTransferObj, ...
 * @return 成功发起请求会返回YES, 其他情况返回NO;
 */
+ (BOOL)sendObj:(CocosRequestObj *)obj;

/*!
 * @brief   处理TP的回调跳转
 * @discuss 在AppDelegate -(application:openURL:options:)方法里调用
 */
+ (BOOL)handleURL:(NSURL *)url
          options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
           result:(void(^)(CocosResponseObj *respObj))result;


@end

NS_ASSUME_NONNULL_END
