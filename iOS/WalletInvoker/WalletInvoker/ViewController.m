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
    loginObj.dappName = @"myDapp";
    [CocosWalletApi sendObj:loginObj];
}

- (IBAction)transferBtnClick:(UIButton *)sender {
    CocosTransferObj *transfer = [[CocosTransferObj alloc] init];
    transfer.dappName = @"myDapp";
    transfer.dappIcon = @"https://gz.bcebos.com/v1/tokenpocket/temp/mobile_sdk_demo.png";
    transfer.symbol = @"COCOS";
    transfer.to = @"syling";
    transfer.memo = @"Memo string...";
    transfer.amount = @"3";
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
