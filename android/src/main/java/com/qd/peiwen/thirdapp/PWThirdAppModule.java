
package com.qd.peiwen.thirdapp;

import android.content.ComponentName;
import android.content.Intent;
import android.net.Uri;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import java.net.URISyntaxException;

public class PWThirdAppModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext context;

    public PWThirdAppModule(ReactApplicationContext context) {
        super(context);
        this.context = context;
    }

    @Override
    public String getName() {
        return "PWThirdApp";
    }

    /*********************电话相关方法*******************************/
    @ReactMethod
    public void phonecall(String phone) {
        try {
            Intent intent = new Intent(Intent.ACTION_CALL);
            intent.setData(Uri.parse("tel:" + phone));
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            this.context.startActivity(intent);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    /*********************导航相关方法*******************************/
    @ReactMethod
    public void navigation(String destination) {
        if (this.gaodeMapApp(destination)) {
            return;
        }

        if (this.baiduMapApp(destination)) {
            return;
        }
    }

    private boolean gaodeMapApp(String destination) {
        try {
            Intent intent = Intent.getIntent("androidamap://route?sourceApplication=softname&sname=我的位置&dname=" + destination + "&dev=0&m=0&t=0");
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            this.context.startActivity(intent);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private boolean baiduMapApp(String destination) {
        try {
            Intent intent = new Intent();
            intent.setData(Uri.parse("baidumap://map/direction?origin=我的位置&destination=" + destination + "&mode=driving&src=andr.baidu.openAPIdemo"));
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    /*********************支付相关方法*******************************/
    @ReactMethod
    public void payment() {
        if (this.wechatPayment()) {
            return;
        }

        if (this.alipayPayment()) {
            return;
        }
    }

    private boolean wechatPayment() {
        try {
            Intent intent = new Intent();
            intent.setComponent(new ComponentName("com.tencent.mm", "com.tencent.mm.ui.LauncherUI"));
            intent.putExtra("LauncherUI.From.Scaner.Shortcut", true);
            intent.setFlags(335544320);
            intent.setAction("android.intent.action.VIEW");
            this.context.startActivity(intent);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    private boolean alipayPayment() {
        try {
            Uri uri = Uri.parse("alipayqr://platformapi/startapp?saId=10000007");
            Intent intent = new Intent(Intent.ACTION_VIEW, uri);
            this.context.startActivity(intent);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}

//     {
//             try{
//
//             Toasty.info(this,"请安装微信或者支付宝").show();
//             }
//             }
//             }
