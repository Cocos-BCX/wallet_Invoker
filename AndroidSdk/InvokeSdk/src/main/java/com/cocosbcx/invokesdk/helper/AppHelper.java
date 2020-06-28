package com.cocosbcx.invokesdk.helper;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.util.Base64;

import com.cocosbcx.invokesdk.constant.Constant;

public class AppHelper {

    /**
     * 获取应用程序名称
     */
    public static String getAppName(Context context) {
        try {
            PackageManager packageManager = context.getPackageManager();
            PackageInfo packageInfo = packageManager.getPackageInfo(
                    context.getPackageName(), 0);
            int labelRes = packageInfo.applicationInfo.labelRes;
            return context.getResources().getString(labelRes);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    /**
     * 检查CocosWallet钱包是否已安装
     */
    public static boolean isCocosWalletInstall(Context context) {
        try {
            context.getPackageManager().getApplicationInfo(Constant.COCOSBCX_PACKAGE_NAME,
                    PackageManager.GET_UNINSTALLED_PACKAGES);
            return true;
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Base64加密,指定utf-8编码
     */
    public static String base64Encode(String content) {
        try {
            return Base64.encodeToString(content.getBytes("utf-8"), Base64.NO_WRAP);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    /**
     * Base64解密，指定utf-8编码
     */
    public static String base64Decode(String encodedString) {
        try {
            return new String(Base64.decode(encodedString, Base64.NO_WRAP), "utf-8");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

}
