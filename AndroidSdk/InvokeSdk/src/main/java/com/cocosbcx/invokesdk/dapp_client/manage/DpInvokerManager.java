package com.cocosbcx.invokesdk.dapp_client.manage;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;

import com.cocosbcx.invokesdk.dapp_client.CocosAssistActivity;
import com.cocosbcx.invokesdk.dapp_client.listener.CocosListener;
import com.cocosbcx.invokesdk.dapp_client.model.Authorize;
import com.cocosbcx.invokesdk.dapp_client.model.BaseResultModel;
import com.cocosbcx.invokesdk.dapp_client.model.Contract;
import com.cocosbcx.invokesdk.dapp_client.model.Transfer;
import com.cocosbcx.invokesdk.helper.AppHelper;
import com.google.gson.Gson;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;


public class DpInvokerManager {

    private static DpInvokerManager sInstance;

    private CocosListener mListener;
    private final static int SUCCESS = 1;
    private final static int CANCEL = 0;
    private final static int ERROR = 2;
    private static final String Dp_SCHEME_HOST = "cocosbcx://wallet.com";

    private DpInvokerManager() {

    }

    public static DpInvokerManager getInstance() {
        if (sInstance == null) {
            synchronized (DpInvokerManager.class) {
                if (sInstance == null) {
                    sInstance = new DpInvokerManager();
                }
            }
        }
        return sInstance;
    }

    private void setCocosListener(CocosListener listener) {
        this.mListener = listener;
    }

    /**
     * 执行操作
     */
    private void doAction(Context context, String action, String param, CocosListener listener) {
        //设置监听器
        setCocosListener(listener);
        invokeCocosWallet(context, action, param);
    }


    /**
     * 转账
     */
    public void transfer(Context context, Transfer transfer, CocosListener listener) {
        doAction(context, transfer.getAction(), new Gson().toJson(transfer), listener);
    }

    /**
     * 授权登陆
     */
    public void authorize(Context context, Authorize authorize, CocosListener listener) {
        doAction(context, authorize.getAction(), new Gson().toJson(authorize), listener);
    }


    /**
     * 调用合约
     */
    public void callContract(Context context, Contract contract, CocosListener listener) {
        doAction(context, contract.getAction(), new Gson().toJson(contract), listener);
    }


    /**
     * 解析数据，并回调
     */
    public void parseIntent(Intent intent) {
        if (mListener == null) {
            return;
        }
        String result = intent.getStringExtra("result");
        BaseResultModel baseResultModel = new Gson().fromJson(result, BaseResultModel.class);
        if (baseResultModel == null) {
            mListener.onError("Unknown error");
            return;
        }
        switch (baseResultModel.getCode()) {
            case ERROR:
                mListener.onError(result);
                break;
            case CANCEL:
                mListener.onCancel(result);
                break;
            case SUCCESS:
            default:
                mListener.onSuccess(result);
                break;
        }
    }

    /**
     * 拉起CocosWallet
     */
    private void invokeCocosWallet(Context context, String action, String param) {
        Intent intent = new Intent();
        //传递包名、类名、app名
        intent.putExtra("packageName", context.getPackageName());
        intent.putExtra("className", CocosAssistActivity.class.getName());
        intent.putExtra("appName", AppHelper.getAppName(context));
        intent.putExtra("action", action);
        //拼凑uri
        intent.setData(getParamUri(param));
        intent.setAction(Intent.ACTION_VIEW);
        //保证新启动的APP有单独的堆栈，如果希望新启动的APP和原有APP使用同一个堆栈则去掉该项
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        try {
            context.startActivity(intent);
        } catch (Exception e) {
            e.printStackTrace();
            if (mListener != null) {
                mListener.onCancel("Please install CocosWallet or upgrade to the latest version");
            }
        }
    }

    /**
     * 获取uri
     */
    private Uri getParamUri(String param) {
        //将param encode处理
        try {
            param = URLEncoder.encode(param, "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String temp = Dp_SCHEME_HOST + "?param=" + param;
        return Uri.parse(temp);
    }

}
