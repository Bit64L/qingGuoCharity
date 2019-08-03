package org.qingGuo.dto;

import org.qingGuo.common.WXPayConstants;
import org.qingGuo.common.WXPayUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class OrderQueryDto {

    private String appid;
    private String mch_id;
    private String nonce_str;
    private String out_trade_no;
    private String sign;
    private final static Logger logger = LoggerFactory.getLogger(junit.framework.Test.class);

    public OrderQueryDto() {
        this.appid = WXPayConstants.APPID;
        this.mch_id = WXPayConstants.WXPAYMENTACCOUNT;
    }

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
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

    public String getOut_trade_no() {
        return out_trade_no;
    }

    public void setOut_trade_no(String out_trade_no) {
        this.out_trade_no = out_trade_no;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public static Logger getLogger() {
        return logger;
    }

    public String generateXMLContent() {
        String xml = "<xml>" +
                "<appid>" + this.appid + "</appid>" +
                "<mch_id>" + this.mch_id + "</mch_id>" +
                "<nonce_str>" + this.nonce_str + "</nonce_str>" +
                "<out_trade_no>" + this.out_trade_no + "</out_trade_no>" +
                "<sign>" + this.sign + "</sign>" +
                "</xml>";
        return xml;
    }

    public String makeSign() {
        String content = "appid=" + this.appid +
                "&mch_id=" + this.mch_id +
                "&nonce_str=" + this.nonce_str +
                "&out_trade_no=" + this.out_trade_no;
        content = content + "&key=" + WXPayConstants.MD5_KEY;
        String esignature = null;
        try {
            esignature = WXPayUtil.MD5(content);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return esignature.toUpperCase();
    }
}
