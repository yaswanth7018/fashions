package com.fashion.controller;

import com.paytm.pg.merchant.PaytmChecksum;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

public class Config {

    public final static String PAYTM_MID = "PVzgWn17633192659045";
    public final static String PAYTM_MERCHANT_KEY = "kotc8YI#HxynoXyB";

    public final static String PAYTM_WEBSITE = "WEBSTAGING";
    public final static String PAYTM_CALLBACK_URL = "http://localhost:9000/jscheckoutjava/callback.jsp";
    public final static String PAYTM_ENVIRONMENT = "https://securegw-stage.paytm.in";

    public static Map<String, Object> getTransactionToken() throws Exception {
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        String generatedOrderID = "PYTM_BLINK_" + timestamp.getTime();
        double amount = 2.00;

        JSONObject paytmParams = new JSONObject();
        JSONObject body = new JSONObject();
        body.put("requestType", "Payment");
        body.put("mid", PAYTM_MID);
        body.put("websiteName", PAYTM_WEBSITE);
        body.put("orderId", generatedOrderID);
        body.put("callbackUrl", PAYTM_CALLBACK_URL);

        JSONObject txnAmount = new JSONObject();
        txnAmount.put("value", amount);
        txnAmount.put("currency", "INR");

        JSONObject userInfo = new JSONObject();
        userInfo.put("custId", "cust_" + timestamp.getTime());

        body.put("txnAmount", txnAmount);
        body.put("userInfo", userInfo);

        String checksum = PaytmChecksum.generateSignature(body.toString(), PAYTM_MERCHANT_KEY);
        JSONObject head = new JSONObject();
        head.put("signature", checksum);

        paytmParams.put("body", body);
        paytmParams.put("head", head);
        String post_data = paytmParams.toString();

        URL url = new URL(PAYTM_ENVIRONMENT + "/theia/api/v1/initiateTransaction?mid=" + PAYTM_MID + "&orderId=" + generatedOrderID);

        String responseData = "";
        Map<String, Object> resultdata = new HashMap<>();

        try {
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setDoOutput(true);

            DataOutputStream requestWriter = new DataOutputStream(connection.getOutputStream());
            requestWriter.writeBytes(post_data);
            requestWriter.close();

            InputStream is = connection.getInputStream();
            BufferedReader responseReader = new BufferedReader(new InputStreamReader(is));

            if ((responseData = responseReader.readLine()) != null) {
                JSONObject obj = new JSONObject(responseData);

                if (obj.has("body")) {
                    JSONObject bodyres = obj.getJSONObject("body");
                    String resultstatus = bodyres.getJSONObject("resultInfo").getString("resultStatus");
                    String resultMsg = bodyres.getJSONObject("resultInfo").getString("resultMsg");

                    if (resultstatus.equals("S")) {
                        String txnToken = bodyres.getString("txnToken");
                        resultdata.put("success", true);
                        resultdata.put("orderId", generatedOrderID);
                        resultdata.put("txnToken", txnToken);
                        resultdata.put("amount", amount);
                        resultdata.put("message", resultMsg);
                    } else {
                        resultdata.put("success", false);
                        resultdata.put("orderId", generatedOrderID);
                        resultdata.put("amount", amount);
                        resultdata.put("message", resultMsg);
                    }
                } else {
                    resultdata.put("success", false);
                    resultdata.put("orderId", generatedOrderID);
                    resultdata.put("amount", amount);
                    resultdata.put("message", "Invalid response from Paytm API");
                }
            }
            responseReader.close();
        } catch (Exception exception) {
            exception.printStackTrace();
            resultdata.put("success", false);
            resultdata.put("orderId", generatedOrderID);
            resultdata.put("amount", amount);
            resultdata.put("message", "Error in processing Paytm API request");
        }
        return resultdata;
    }
}
