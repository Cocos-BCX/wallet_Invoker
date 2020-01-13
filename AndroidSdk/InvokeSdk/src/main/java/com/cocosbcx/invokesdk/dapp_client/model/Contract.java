package com.cocosbcx.invokesdk.dapp_client.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

/**
 * 合约信息
 */

@Setter
@Getter
public class Contract extends BaseInfo {

    private String contractNameOrId;

    private String functionName;

    private List valueList;

    public Contract() {
        setAction(ActionEnum.CallContract.getValue());
    }
}
