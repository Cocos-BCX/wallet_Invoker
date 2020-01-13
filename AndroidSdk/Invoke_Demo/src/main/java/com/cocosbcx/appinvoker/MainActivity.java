package com.cocosbcx.appinvoker;

import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.cocosbcx.invokesdk.dapp_client.listener.CocosListener;
import com.cocosbcx.invokesdk.dapp_client.manage.DpInvokerManager;
import com.cocosbcx.invokesdk.dapp_client.model.Authorize;
import com.cocosbcx.invokesdk.dapp_client.model.Contract;
import com.cocosbcx.invokesdk.dapp_client.model.Transfer;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        final TextView result = findViewById(R.id.tv_callback_result);
        findViewById(R.id.tv_auth_login).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                DpInvokerManager.getInstance().authorize(MainActivity.this, getAuthorize(), new CocosListener() {
                    @Override
                    public void onSuccess(String data) {
                        Toast.makeText(MainActivity.this, data, Toast.LENGTH_SHORT).show();
                        result.setText(data);
                    }

                    @Override
                    public void onError(String data) {
                        Toast.makeText(MainActivity.this, data, Toast.LENGTH_SHORT).show();
                        result.setText(data);
                    }

                    @Override
                    public void onCancel(String data) {
                        Toast.makeText(MainActivity.this, data, Toast.LENGTH_SHORT).show();
                        result.setText(data);
                    }
                });
            }
        });

        findViewById(R.id.tv_transfer).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                DpInvokerManager.getInstance().transfer(MainActivity.this, getTransfer(), new CocosListener() {
                    @Override
                    public void onSuccess(String data) {
                        Toast.makeText(MainActivity.this, data, Toast.LENGTH_SHORT).show();
                        result.setText(data);
                    }

                    @Override
                    public void onError(String data) {
                        Toast.makeText(MainActivity.this, data, Toast.LENGTH_SHORT).show();
                        result.setText(data);
                    }

                    @Override
                    public void onCancel(String data) {
                        Toast.makeText(MainActivity.this, data, Toast.LENGTH_SHORT).show();
                        result.setText(data);
                    }
                });
            }
        });

        findViewById(R.id.tv_call_contract).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                DpInvokerManager.getInstance().callContract(MainActivity.this, getContract(), new CocosListener() {
                    @Override
                    public void onSuccess(String data) {
                        Toast.makeText(MainActivity.this, data, Toast.LENGTH_SHORT).show();
                        result.setText(data);
                    }

                    @Override
                    public void onError(String data) {
                        Toast.makeText(MainActivity.this, data, Toast.LENGTH_SHORT).show();
                        result.setText(data);
                    }

                    @Override
                    public void onCancel(String data) {
                        Toast.makeText(MainActivity.this, data, Toast.LENGTH_SHORT).show();
                        result.setText(data);
                    }
                });
            }
        });


    }

    /**
     * 按照协议构建对象 Authorize
     */
    private Authorize getAuthorize() {
        Authorize authorize = new Authorize();
        authorize.setDappName("Newdex");
        authorize.setDappIcon("https://newdex.io/static/logoicon.png");
        authorize.setActionId("web-99784c28-70f0-49ff-3654-f27b137b3502");
        authorize.setExpired(1537157808L);
        return authorize;
    }

    /**
     * 按照协议构建对象 Transfer
     */
    private Transfer getTransfer() {
        Transfer transfer = new Transfer();
        transfer.setDappName("Newdex");
        transfer.setDappIcon("https://newdex.io/static/logoicon.png");
        transfer.setFrom("gnkhandsome1");
        transfer.setTo("gnkhandsome2");
        transfer.setAmount(0.0001);
        transfer.setSymbol("COCOS");
        transfer.setPrecision(5);
        transfer.setMemo("test");
        transfer.setExpired(1535944144L);
        return transfer;
    }


    /**
     * 按照协议构建对象 Contract
     */
    private Contract getContract() {
        List list = new ArrayList();
        list.add("fasd");
        Contract contract = new Contract();
        contract.setDappName("Newdex");
        contract.setDappIcon("https://newdex.io/static/logoicon.png");
        contract.setContractNameOrId("1.16.13");
        contract.setFunctionName("1.16.13");
        contract.setValueList(list);
        contract.setExpired(1535944144L);
        return contract;
    }

}
