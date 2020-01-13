//
//  CocosRequestObj.m
//  WalletInvoker
//
//  Created by 邵银岭 on 2020/1/7.
//  Copyright © 2020 邵银岭. All rights reserved.
//

#import "CocosRequestObj.h"

NSString *const kCocosSDKActionLogin = @"login";
NSString *const kCocosSDKActionTransfer = @"transfer";
NSString *const kCocosSDKActionCallContract = @"callcontract";

@implementation CocosRequestObj

- (instancetype)init {
    if (self = [super init]) {
        _protocol = @"CocosBCXWallet";
        _version = @"1.0.0";
        if ([self isKindOfClass:CocosLoginObj.class]) {
            _action = kCocosSDKActionLogin;
        }else if ([self isKindOfClass:CocosTransferObj.class]) {
            _action = kCocosSDKActionTransfer;
        }else if ([self isKindOfClass:CocosCallContractObj.class]) {
            _action = kCocosSDKActionCallContract;
        }
    }
    return self;
}
@end

#pragma mark - CocosLoginObj -

@implementation CocosLoginObj

@end

#pragma mark - CocosTransferObj -

@implementation CocosTransferObj

@end

#pragma mark - CocosCallContractObj -

@implementation CocosCallContractObj

@end
