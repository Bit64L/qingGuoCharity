package org.qingGuo.dto;


import org.junit.Test;
import org.qingGuo.common.WXPayConstants;
import org.qingGuo.common.WXPayUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UnifiedorderDto {

    private String appid;
    private String body;
    private String device_info;
    private String mch_id;
    private String nonce_str;
    private String notify_url;
    private String openId;
    private String out_trade_no;
    private String spbill_create_ip;
    private int total_fee;
    private String trade_type;
    private String product_id;
    private String sign;
    private final static Logger logger = LoggerFactory.getLogger(junit.framework.Test.class);

    public UnifiedorderDto(String callbackUrl) {
        this.appid = WXPayConstants.APPID;
        this.mch_id = WXPayConstants.WXPAYMENTACCOUNT;
        this.device_info = WXPayConstants.DEVICE_INFO_WEB;
        this.notify_url = callbackUrl;
        this.trade_type = WXPayConstants.TRADE_TYPE_NATIVE;
    }

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getDevice_info() {
        return device_info;
    }

    public void setDevice_info(String device_info) {
        this.device_info = device_info;
    }

    public String getMch_id() {
        return mch_id;
    }

    public void setMch_id(String mch_id) {
        this.mch_id = mch_id;
    }

    public String getNonce_str() {
        return nonce_str;
    }

    public void setNonce_str(String nonce_str) {
        this.nonce_str = nonce_str;
    }

    public String getNotify_url() {
        return notify_url;
    }

    public void setNotify_url(String notify_url) {
        this.notify_url = notify_url;
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }

    public String getOut_trade_no() {
        return out_trade_no;
    }

    public void setOut_trade_no(String out_trade_no) {
        this.out_trade_no = out_trade_no;
    }

    public String getSpbill_create_ip() {
        return spbill_create_ip;
    }

    public void setSpbill_create_ip(String spbill_create_ip) {
        this.spbill_create_ip = spbill_create_ip;
    }

    public int getTotal_fee() {
        return total_fee;
    }

    public void setTotal_fee(int total_fee) {
        this.total_fee = total_fee;
    }

    public String getTrade_type() {
        return trade_type;
    }

    public void setTrade_type(String trade_type) {
        this.trade_type = trade_type;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String generateXMLContent() {
        String xml = "<xml>" +
                "<appid>" + this.appid + "</appid>" +
                "<body>" + this.body + "</body>" +
                "<device_info>WEB</device_info>" +
                "<mch_id>" + this.mch_id + "</mch_id>" +
                "<nonce_str>" + this.nonce_str + "</nonce_str>" +
                "<notify_url>" + this.notify_url + "</notify_url>" +
                "<out_trade_no>" + this.out_trade_no + "</out_trade_no>" +
                "<product_id>" + this.product_id + "</product_id>" +
                "<spbill_create_ip>" + this.spbill_create_ip + "</spbill_create_ip>" +
                "<total_fee>" + String.valueOf(this.total_fee) + "</total_fee>" +
                "<trade_type>" + this.trade_type + "</trade_type>" +
                "<sign>" + this.sign + "</sign>" +
                "</xml>";
        return xml;
    }

    public String makeSign() {
        String content = "appid=" + this.appid +
                "&body=" + this.body +
                "&device_info=WEB" +
                "&mch_id=" + this.mch_id +
                "&nonce_str=" + this.nonce_str +
                "&notify_url=" + this.notify_url +
                "&out_trade_no=" + this.out_trade_no +
                "&product_id=" + this.product_id +
                "&spbill_create_ip=" + this.spbill_create_ip +
                "&total_fee=" + String.valueOf(this.total_fee) +
                "&trade_type=" + this.trade_type;
        content = content + "&key=" + WXPayConstants.MD5_KEY;
        logger.info(content);
        String esignature = null;
        try {
            esignature = WXPayUtil.MD5(content);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return esignature.toUpperCase();
    }


    @Test
    public void test() {
        //String str = "appid=wxb12c86bf0b51f2fd&body=test&device_info=WEB&mch_id=1496314082&nonce_str=232728525810808&notify_url=http://47.95.4.158/qingguo/wxpay/paySuccess&out_trade_no=1&product_id=1&spbill_create_ip=47.95.4.158&total_fee=1&trade_type=NATIVE&key=ABCDEFGH12345678abcdefgh87654321";
        String str1 = "appid=wxb12c86bf0b51f2fd&body=test&device_info=WEB&mch_id=1496314082&nonce_str=234401751488646&notify_url=http://47.95.4.158/qingguo/wxpay/paySuccess&out_trade_no=1&product_id=1&spbill_create_ip=47.95.4.158&total_fee=1&trade_type=NATIVE&key=ABCDEFGH12345678abcdefgh87654321";
        String str2 = "appid=wxb12c86bf0b51f2fd&body=test&device_info=WEB&mch_id=1496314082&nonce_str=234401751488646&notify_url=http://47.95.4.158/qingguo/wxpay/paySuccess&out_trade_no=1&product_id=1&spbill_create_ip=47.95.4.158&total_fee=1&trade_type=NATIVE&key=ABCDEFGH12345678abcdefgh87654321";
        String sign = null;
        try {
            sign = WXPayUtil.MD5(str2);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(sign);
    }

}
