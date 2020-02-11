## Android CocosWallet SDK接入文档

### 说明&支持
- 该SDK用于拉起CocosWallet钱包，实现Dapp和CocosWallet进行相关action操作的交互。
- 该SDK仅支持2.1.6及其以上版本的CocosWallet钱包。

### 开始接入

#### 本地maven仓库方式接入

- 添加sdk-aar文件到项目根目录
- 项目根目录build.gradle文件添加 mavenUrl

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

```
implementation 'com.cocosbcx.invokesdk:InvokeSdk:1.0.0'
```

### 使用

### APIs

#### 1.授权登录 (Authorize)

```
    Authorize authorize = new Authorize();
    authorize.setDappName("DappName"); // dapp应用名称
    authorize.setDappIcon("https://logoicon.png");// dapp icon
    authorize.setActionId("web-99784c28-70f0-49ff-3654-f27b137b3502");// 操作标识uuid
    authorize.setExpired(1537157808L); // 操作过期时间
    authorize.setDesc("desc content"); // 操作描述
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

#### 2.转账(Transfer)

```
    Transfer transfer = new Transfer();
    transfer.setDappName("Newdex");// dapp应用名称
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

#### 3.合约调用(Contract)

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



