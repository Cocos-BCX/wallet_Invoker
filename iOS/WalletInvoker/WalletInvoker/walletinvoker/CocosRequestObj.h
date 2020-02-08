//
//  CocosRequestObj.h
//  WalletInvoker
//
//  Created by 邵银岭 on 2020/1/7.
//  Copyright © 2020 邵银岭. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - CocosRequestObj
/*! @class   CocosRequestObj
 * @abstract 发起请求的基本数据
 * @discuss  避免自己继承CocosRequestObj, 发起请求时只发送SDK内部的CocosRequestObj子类;
 */
@interface CocosRequestObj : NSObject

@property (nonatomic, copy, readonly) NSString *protocol;   //!< 协议名，钱包用来区分不同协议，本协议为 CocosBCXWallet
@property (nonatomic, copy, readonly) NSString *version;    //!< 协议版本信息,如1.0
@property (nonatomic, copy, readonly) NSString *action;     //!< login,transfer...(子类自动赋值)       <autofill>
@property (nonatomic, copy) NSString *dappName;             //!< dapp名字,用于在钱包展示                <optional>
@property (nonatomic, copy) NSString *dappIcon;             //!< dapp图标Url,用于在钱包展示             <optional>
@property (nonatomic, copy) NSString *actionId;             //!< 本次操作的唯一标识                     <optional>
@property (nonatomic, copy) NSNumber *expired;              //!< 过期时间，时间戳(s)；默认0，为永不过期    <optional>

@property (nonatomic, copy) NSString *desc; //!< 作为附加展示信息                     <optional>

//@property (nonatomic, copy) NSString *callbackUrl;          //!< 回调url,通过此url将txId和actionId通过post请求告诉dappServer

/**
 * @abstract 处理完成后的回调，回调通知DApp;
 * @discuss  格式为: xxx://xxx?param;  xxx部分可自定义;
 */
@property (nonatomic, copy) NSString *callbackSchema;

@end

#pragma mark - CocosLoginObj -

/*!
 * @class CocosLoginObj
 * @brief 获取账户信息
 */
@interface CocosLoginObj : CocosRequestObj

@end

#pragma mark - CocosTransferObj -

/*!
 * @class CocosTransferObj
 * @brief 交易/转账数据
 */
@interface CocosTransferObj : CocosRequestObj

@property (nonatomic, copy) NSString *from;                 //!< 付款人的COCOS账号        <required>
@property (nonatomic, copy) NSString *to;                   //!< 收款人的COCOS账号        <required>
@property (nonatomic, copy) NSString *amount;               //!< 转账数额       <required>
@property (nonatomic, copy) NSString *symbol;               //!< token的名称           <required>
@property (nonatomic, copy) NSString *memo;                 //!< 转账备注                     <optional>
@end

#pragma mark - CocosCallContractObj -

/*!
 * @class CocosCallContractObj
 * @brief 调用合约
 */
@interface CocosCallContractObj : CocosRequestObj

@property (nonatomic, copy) NSString *from;                 //!< 调用者的COCOS账号        <optional>
@property (nonatomic, copy) NSString *contract;             //!< 合约名称或者ID        <required>
@property (nonatomic, copy) NSString *method;               //!< 合约方法名称        <required>
@property (nonatomic, strong) NSArray *param;               //!< 调用参数       <required>
@end


NS_ASSUME_NONNULL_END
