package com.cocosbcx.invokesdk.dapp_client.model;

/**
 * Author: tp-clement
 * Create: 2019/4/1
 * Desc: 操作类型
 */
public enum ActionEnum {

    /**
     * 转账
     */
    Transfer("transfer"),

    /**
     * 合约调用
     */
    CallContract("callContract"),

    /**
     * 授权账户
     */
    Authorize("login");


    private String value;

    ActionEnum(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
