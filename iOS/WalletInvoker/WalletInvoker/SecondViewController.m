//
//  SecondViewController.m
//  WalletInvoker
//
//  Created by 邵银岭 on 2020/1/7.
//  Copyright © 2020 邵银岭. All rights reserved.
//

#import "SecondViewController.h"
#import "CocosWalletApi.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)loginBtnClick:(UIButton *)sender {

    CocosLoginObj *loginObj = [[CocosLoginObj alloc] init];
    loginObj.dappIcon = @"icon";
    loginObj.dappName = @"myDapp";
    [CocosWalletApi sendObj:loginObj];

}
- (IBAction)transferBtnClick:(UIButton *)sender {
    
    CocosTransferObj *transferObj = [[CocosTransferObj alloc] init];
    transferObj.dappIcon = @"icon";
    transferObj.dappName = @"myDapp";
    transferObj.dappName = @"myDapp";
    transferObj.from = @"xxx";
    transferObj.to = @"ooo";
    [CocosWalletApi sendObj:transferObj];
}

- (IBAction)callContractBtnClick:(UIButton *)sender {
    
    
}

@end
