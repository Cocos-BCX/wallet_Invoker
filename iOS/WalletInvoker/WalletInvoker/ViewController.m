//
//  ViewController.m
//  WalletInvoker
//
//  Created by 邵银岭 on 2020/1/6.
//  Copyright © 2020 邵银岭. All rights reserved.
//

#import "ViewController.h"
#import "CocosWalletApi.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)loginBtnClick:(UIButton *)sender {
    CocosLoginObj *loginObj = [[CocosLoginObj alloc] init];
    loginObj.dappIcon = @"https://gz.bcebos.com/v1/tokenpocket/temp/mobile_sdk_demo.png";
    loginObj.dappName = @"Dapp Test";
    loginObj.desc = @"请求登录的描述信息";
    [CocosWalletApi sendObj:loginObj];
}

- (IBAction)transferBtnClick:(UIButton *)sender {
    CocosTransferObj *transfer = [[CocosTransferObj alloc] init];
    transfer.dappName = @"Dapp Test";
    transfer.dappIcon = @"https://gz.bcebos.com/v1/tokenpocket/temp/mobile_sdk_demo.png";
    transfer.desc = @"请求转账的描述信息";
    transfer.symbol = @"COCOS";
    transfer.to = @"syling1";
    transfer.memo = @"Memo string xxxooo";
    transfer.amount = @"3";
    transfer.from = @"syling";
    [CocosWalletApi sendObj:transfer];
}

- (IBAction)callContractBtnClick:(UIButton *)sender {
    
    CocosCallContractObj *callContract = [[CocosCallContractObj alloc] init];
    callContract.dappName = @"myDapp";
    callContract.dappIcon = @"https://gz.bcebos.com/v1/tokenpocket/temp/mobile_sdk_demo.png";
    callContract.param = @[@"COCOS"];
    callContract.from = @"syling";
    callContract.contract = @"contract.dicegame";
    callContract.method = @"hello";
    [CocosWalletApi sendObj:callContract];
}


@end
