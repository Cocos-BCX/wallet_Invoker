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
    loginObj.dappIcon = @"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1552892908,1688888225&fm=26&gp=0.jpg";
    loginObj.dappName = @"Dapp Test";
    loginObj.desc = @"请求登录的描述信息";
    [CocosWalletApi sendObj:loginObj];
}

- (IBAction)transferBtnClick:(UIButton *)sender {
    CocosTransferObj *transfer = [[CocosTransferObj alloc] init];
    transfer.dappName = @"Dapp Test";
    transfer.dappIcon = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581336823814&di=854974e1a9bf2f774add305a7c0d417c&imgtype=0&src=http%3A%2F%2Fimg.jk51.com%2Fimg_jk51%2F78884959.jpeg";
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
    callContract.dappIcon = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581336466306&di=86e0f6afdd435ee39dc57fbf7de11d81&imgtype=0&src=http%3A%2F%2F07.imgmini.eastday.com%2Fmobile%2F20180306%2F20180306_1f79b02260b76a95a2a8dfe68ef9fe10.png";
    callContract.param = @[@(10)];
    callContract.from = @"syling";
    callContract.contract = @"contract.testnumber";
    callContract.method = @"hello";
    callContract.desc = @"请求调用合约的描述信息";
    [CocosWalletApi sendObj:callContract];
}


@end
