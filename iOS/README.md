## iOS CocosWallet SDK接入文档iOS CocosWallet SDK Access Documentation

### 说明&支持Instructions & Support
- 该SDK用于拉起CocosWallet钱包，实现Dapp和CocosWallet进行相关action操作的交互。
- 该SDK仅支持2.1.6及其以上版本的CocosWallet钱包。
-This SDK is used to pull up the CocosWallet wallet and realize the interaction between Dapp and CocosWallet for related action operations.
-The SDK only supports CocosWallet wallets of version 2.1.6 and above.

- 实例参考案例 Walletinvoker 项目
-Examples Reference Case Walletinvoker Project

### 1. 手动拖入 Walletinvoker 项目中 walletinvoker 文件夹到自己的项目中
### 1. Drag the walletinvoker folder from the Walletinvoker project into your project manually

### 2. 配置 URL Schemes，2. Configure URL Schemes,
	- 为了CocosWallet 能回调数据给自己的AppIn order for CocosWallet to call back data to its App

- 打开info.plist 配置如下：（以 dappdemo 为案例）Open the info.plist configuration as follows: (taking dappdemo as an example)

![](../image/URL Schemes.png)


### 3. 初始化Initialization
- 在 AppDelegate.m 文件中初始化
- Initialized in AppDelegate.m file
	- 引用头文件 #import "CocosWalletApi.h"
  - Reference header file #import "CocosWalletApi.h"

- 在 `application:didFinishLaunchingWithOptions` 方法中注册 URL Schemes
- Register URL Schemes in the `application: didFinishLaunchingWithOptions` method
	- [CocosWalletApi registerAppID:@"dappdemo"];

### APIs

#### 1. Authorized Login (CocosLoginObj)

```ruby
     CocosLoginObj *loginObj = [[CocosLoginObj alloc] init];
    loginObj.dappIcon = @"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1552892908,1688888225&fm=26&gp=0.jpg";
    loginObj.dappName = @"Dapp Test";
    loginObj.desc = @"请求登录的描述信息Description of the requested login";
    [CocosWalletApi sendObj:loginObj];
```

#### 2. Transfer(Transfer)

```ruby
    CocosTransferObj *transfer = [[CocosTransferObj alloc] init];
    transfer.dappName = @"Dapp Test";
    transfer.dappIcon = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581336823814&di=854974e1a9bf2f774add305a7c0d417c&imgtype=0&src=http%3A%2F%2Fimg.jk51.com%2Fimg_jk51%2F78884959.jpeg";
    transfer.desc = @"请求转账的描述信息Description of the requested transfer";
    transfer.symbol = @"COCOS";
    transfer.to = @"syling1";
    transfer.memo = @"Memo string xxxooo";
    transfer.amount = @"3";
    transfer.from = @"syling";
    [CocosWalletApi sendObj:transfer];
```

#### 3. Contract Call(CocosCallContractObj)

```ruby
    CocosCallContractObj *callContract = [[CocosCallContractObj alloc] init];
    callContract.dappName = @"myDapp";
    callContract.dappIcon = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581336466306&di=86e0f6afdd435ee39dc57fbf7de11d81&imgtype=0&src=http%3A%2F%2F07.imgmini.eastday.com%2Fmobile%2F20180306%2F20180306_1f79b02260b76a95a2a8dfe68ef9fe10.png";
    callContract.param = @[@(10)];
    callContract.from = @"syling";
    callContract.contract = @"contract.testnumber";
    callContract.method = @"hello";
    callContract.desc = @"请求调用合约的描述信息Request the description of the calling contract";
    [CocosWalletApi sendObj:callContract];
```



