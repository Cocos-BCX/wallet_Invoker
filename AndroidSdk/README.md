## Android CocosWallet SDK Access Documentation

### Instructions & Support
- 该SDK用于拉起CocosWallet钱包，实现Dapp和CocosWallet进行相关action操作的交互。
- 该SDK仅支持2.1.6及其以上版本的CocosWallet钱包。
-This SDK is used to pull up the CocosWallet wallet and realize the interaction between Dapp and CocosWallet for related action operations.
-The SDK only supports CocosWallet wallets of version 2.1.6 and above.

### 开始接入Start access

#### 本地maven仓库方式接入Local maven warehouse access

- 添加sdk-aar文件到项目根目录
- 项目根目录build.gradle文件添加 mavenUrl
-Add sdk-aar file to the project root directory
-Add mavenUrl to the project root build.gradle file

```
  allprojects {
      repositories {
          google()
          jcenter()
          maven {
              url rootProject.file('sdk-aar')
          }
      }
  }
```

- 依赖sdk的module,build.gralde文件添加依赖如下
- Depends on sdk module, build.gralde file adds dependencies as follows

```
implementation 'com.cocosbcx.invokesdk:InvokeSdk:1.0.0'
```

### 使用 Instructions

### APIs

#### 1.Login Authorize (Authorize)

```
    Authorize authorize = new Authorize();
    authorize.setDappName("DappName"); // dapp name
    authorize.setDappIcon("https://logoicon.png");// dapp icon
    authorize.setActionId("web-99784c28-70f0-49ff-3654-f27b137b3502");// action ID (uuid)
    authorize.setExpired(1537157808L); // 操作过期时间Operation expiration time
    authorize.setDesc("desc content"); // 操作描述operation description
    DpInvokerManager.getInstance().authorize(context,        authorize,new CocosListener() {
        @Override
        public void onSuccess(String data) {

        }

        @Override
        public void onError(String data) {

        }

        @Override
        public void onCancel(String data) {

        }
});
```

#### 2.Transfer(Transfer)

```
    Transfer transfer = new Transfer();
    transfer.setDappName("Newdex");// dapp name
    transfer.setDappIcon("https://newdex.io/static/logoicon.png");
    transfer.setActionId("web-99784c28-70f0-49ff-3654-f27b137b3502");
    transfer.setExpired(1537157808L);
    transfer.setDesc("desc content");
    transfer.setFrom("gnkhandsome1");
    transfer.setTo("gnkhandsome2");
    transfer.setAmount(0.0001);
    transfer.setSymbol("COCOS");
    transfer.setPrecision(5);
    transfer.setMemo("test");
    DpInvokerManager.getInstance().transfer(context,        transfer,new CocosListener() {
        @Override
        public void onSuccess(String data) {
        }

        @Override
        public void onError(String data) {
        }

        @Override
        public void onCancel(String data) {

        }
});
```

#### 3.Calling contract(Contract)

```
   Contract contract = new Contract();
    contract.setDappName("Newdex");
    contract.setDappIcon("https://newdex.io/static/logoicon.png");
    contract.setActionId("web-99784c28-70f0-49ff-3654-f27b137b3502");
    contract.setExpired(1537157808L);
    contract.setDesc("desc content");
    contract.setContractNameOrId("1.16.13");
    contract.setFunctionName("1.16.13");
    contract.setValueList(new ArrayList());
    DpInvokerManager.getInstance().callContract(context,         contract,new CocosListener() {
        @Override
        public void onSuccess(String data) {
        }

        @Override
        public void onError(String data) {
        }

        @Override
        public void onCancel(String data) {
        }
});
```



