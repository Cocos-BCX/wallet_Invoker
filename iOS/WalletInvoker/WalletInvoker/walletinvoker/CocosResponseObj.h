//
//  CocosResponseObj.h
//  WalletInvoker
//
//  Created by 邵银岭 on 2020/1/7.
//  Copyright © 2020 邵银岭. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/**  回调结果状态 */
typedef NS_ENUM(NSUInteger, CocosRespResult) {
    CocosRespResultCanceled = 0,       // 取消
    CocosRespResultSuccess,            // 成功
    CocosRespResultFailure,            // 失败
};



/*!
 * @brief 跳转回调
 */
@interface CocosResponseObj : NSObject

@property (nonatomic, assign) CocosRespResult result;      //!< 处理结果
@property (nonatomic, copy) NSString *action;              //!< 回调类型
@property (nonatomic, copy) NSString *message;             //!< 消息
@property (nonatomic, weak) id data;                       //!< 结果数据

@end

NS_ASSUME_NONNULL_END
