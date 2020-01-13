package com.cocosbcx.invokesdk.dapp_client.model;


import com.cocosbcx.invokesdk.BuildConfig;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

/**
 * 协议的基类
 */
@Setter
@Getter
public abstract class BaseInfo implements Serializable {

    /**
     * 协议
     */
    private String protocol = "cocosbcx";

    /**
     * 版本号
     */
    private String version = BuildConfig.VERSION_NAME;

    /**
     * dapp名称
     */
    private String dappName;

    /**
     * dapp 图标
     */
    private String dappIcon;

    /**
     * 执行的操作类型:transfer,pushTransaction,login,sign
     */
    private String action;

    /**
     * 执行的操作id标识
     */
    private String actionId;

    /**
     * 过期时间，单位为秒
     */
    private long expired;

    /**
     * 操作描述
     */
    private String desc;
}
