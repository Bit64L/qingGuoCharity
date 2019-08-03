package org.qingGuo.controller;

import junit.framework.Test;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.qingGuo.common.OrderValue;
import org.qingGuo.common.WXPayConstants;
import org.qingGuo.common.WXPayUtil;
import org.qingGuo.dto.OrderQueryDto;
import org.qingGuo.dto.UnifiedorderDto;
import org.qingGuo.model.Order;
import org.qingGuo.service.impl.OrderService;
import org.qingGuo.service.impl.UserService;
import org.qingGuo.service.impl.WxPayService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/wxpay")
public class WxPayController {
    @Resource
    WxPayService wxPayService;
    @Resource
    OrderService orderService;
    private final static Logger logger = LoggerFactory.getLogger(Test.class);
    @Resource
    UserService userService;


    @RequestMapping(value = "pay")
    public String pay(Order order, ModelMap modelMap) {
        Map<String, Object> map = new HashMap<>();
        map.put("order", order);
        List<Order> orders = orderService.get(map);
        order = orders.get(0);
        String cash = "0.01";
        UnifiedorderDto dto;
        if (order.getType().equals(OrderValue.Commodity_TYPE))
            dto = new UnifiedorderDto(WXPayConstants.CALLBACK_URL);
        else if (order.getType().equals(OrderValue.Deposit_TYPE))
            dto = new UnifiedorderDto(WXPayConstants.CALLBACK_URL_PAY_DEPOSITY);
        else return "error/error";
        if (cash == null || "".equals(cash)) {
            modelMap.put("error", "cash could not be zero");
            return "error/error";
        }
        double tmp = Double.parseDouble(cash);
        int totalFee = (int) (100 * tmp);
        dto.setProduct_id(String.valueOf("1"));
        dto.setBody("test");
        dto.setNonce_str(String.valueOf(System.nanoTime()));
        dto.setOut_trade_no(order.getId());
        dto.setTotal_fee(totalFee);
        dto.setSpbill_create_ip("47.95.4.158");
        dto.setSign(dto.makeSign());
        logger.info("sign : " + dto.makeSign());
        logger.info("xml content : " + dto.generateXMLContent());
        try {
            //request
            HttpClient httpClient = HttpClientBuilder.create().build();
            HttpPost post = new HttpPost(WXPayConstants.UNIFIEDORDER_URL);
            post.addHeader("Content-Type", "text/xml; charset=UTF-8");
            StringEntity xmlEntity = new StringEntity(dto.generateXMLContent(), ContentType.TEXT_XML);
            post.setEntity(xmlEntity);
            HttpResponse httpResponse = httpClient.execute(post);
            //response
            String responseXML = EntityUtils.toString(httpResponse.getEntity(), "UTF-8");
            logger.info("response xml content : " + responseXML);
            // parse CODE_URL CONTENT
            Map<String, String> modelMapMap = WXPayUtil.xmlToMap(responseXML);
            logger.info("response code_url : " + modelMapMap.get("code_url"));
            String codeurl = modelMapMap.get("code_url");
            if (codeurl != null && !"".equals(codeurl)) {
                String imageUrl = wxPayService.generateQrcode(codeurl);
                modelMap.put("imageUrl", imageUrl);
            }
            post.releaseConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        modelMap.put("success", "1");
        modelMap.put("order", order);
        return "pay/qgCharge";
    }


    @RequestMapping(value = "paySuccess")
    public @ResponseBody
    void paySuccess(HttpServletRequest request, HttpServletResponse response) {
        try {
            logger.info("start to callback from weixin server: " + request.getRemoteHost());
            Map<String, String> resultMap = new HashMap<String, String>();
            InputStream inputStream = request.getInputStream();
            // 读取输入流
            SAXBuilder saxBuilder = new SAXBuilder();
            Document document = saxBuilder.build(inputStream);
            // 得到xml根元素
            Element root = document.getRootElement();
            // 得到根元素的所有子节点
            List list = root.getChildren();
            Iterator it = list.iterator();
            while (it.hasNext()) {
                Element e = (Element) it.next();
                String k = e.getName();
                String v = "";
                List children = e.getChildren();
                if (children.isEmpty()) {
                    v = e.getTextNormalize();
                } else {
                    v = WXPayUtil.getChildrenText(children);
                }
                resultMap.put(k, v);
            }

            // 验证签名！！！
        /*
        String[] keys = resultMap.keySet().toArray(new String[0]);
        Arrays.sort(keys);
        String kvparams = "";
        for(int i=0; i<keys.length; i++) {
            if(keys[i].equals("esign")) {
                continue;
            }
            // 签名算法
            if(i == 0) {
                kvparams += (keys[i] + "=" + resultMap.get(keys[i]));
            } else {
                kvparams += ("&" + keys[i] + "=" + resultMap.get(keys[i]));
            }
        }
        String esign = kvparams + "&key=" + WeiXinConstants.MD5_API_KEY;
        String md5esign = WeiXinPaymentUtil.MD5Encode(esign, "UTF-8");
        if(!md5esign.equals(resultMap.get("sign"))) {
            return;
        }*/

            //关闭流
            // 释放资源
            inputStream.close();
            inputStream = null;
            String returnCode = resultMap.get("return_code");
            String outTradeNo = resultMap.get("out_trade_no");
            // 以分为单位
            int totalFee = Integer.parseInt(resultMap.get("total_fee"));
            logger.info("out trade no : " + outTradeNo);
            logger.info("total_fee : " + totalFee);
            // 业务处理流程
            if ("SUCCESS".equals(returnCode)) {
                Order order = new Order();
                order.setId(outTradeNo);
                Map<String, Object> map = new HashMap<>();
                map.put("order", order);
                List<Order> orders = orderService.get(map);
                order = orders.get(0);
                order.setStatus(OrderValue.PAYED);
                map.put("order", order);
                orderService.update(map);
                String msg = "success";
                response.setContentType("text/xml");
                response.getWriter().println(msg);
            } else {
                Order order = new Order();
                order.setId(outTradeNo);
                Map<String, Object> map = new HashMap<>();
                map.put("order", order);
                List<Order> orders = orderService.get(map);
                order = orders.get(0);
                order.setStatus(OrderValue.WAIT_TO_PAY);
                map.put("order", order);
                orderService.update(map);
            }
        } catch (IOException ioe) {
            ioe.printStackTrace();
        } catch (JDOMException e1) {
            e1.printStackTrace();
        }
    }

    @RequestMapping(value = "orderQuery")
    public @ResponseBody
    String orderQuery(Order order) {
        OrderQueryDto orderQueryDto = new OrderQueryDto();
        orderQueryDto.setOut_trade_no(order.getId());
        orderQueryDto.setNonce_str(String.valueOf(System.nanoTime()));
        orderQueryDto.setSign(orderQueryDto.makeSign());
        logger.info("sign:" + orderQueryDto.makeSign());
        logger.info("xml:" + orderQueryDto.generateXMLContent());

        try {
            //request
            HttpClient httpClient = HttpClientBuilder.create().build();
            HttpPost post = new HttpPost(WXPayConstants.DOMAIN_API + WXPayConstants.ORDERQUERY_URL_SUFFIX);
            post.addHeader("Content-Type", "text/xml; charset=UTF-8");
            StringEntity xmlEntity = new StringEntity(orderQueryDto.generateXMLContent(), ContentType.TEXT_XML);
            post.setEntity(xmlEntity);
            HttpResponse httpResponse = httpClient.execute(post);
            //response
            String responseXML = EntityUtils.toString(httpResponse.getEntity(), "UTF-8");
            logger.info("response xml content : " + responseXML);
            Map<String, String> modelMapMap = WXPayUtil.xmlToMap(responseXML);
            String returnCode = modelMapMap.get("return_code");
            String resultCode, tradeState;
            if (returnCode.equals("SUCCESS")) {
                resultCode = modelMapMap.get("result_code");
                if (resultCode.equals("SUCCESS")) {
                    tradeState = modelMapMap.get("trade_state");
                    if (tradeState.equals("SUCCESS")) {
                        return "SUCCESS";
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "FAIL";
    }


    @RequestMapping(value = "depositPaySuccess")
    public @ResponseBody
    void depositPaySuccess(HttpServletRequest request, HttpServletResponse response) {
        try {
            logger.info("start to callback from weixin server: " + request.getRemoteHost());
            Map<String, String> resultMap = new HashMap<String, String>();
            InputStream inputStream = request.getInputStream();
            // 读取输入流
            SAXBuilder saxBuilder = new SAXBuilder();
            Document document = saxBuilder.build(inputStream);
            // 得到xml根元素
            Element root = document.getRootElement();
            // 得到根元素的所有子节点
            List list = root.getChildren();
            Iterator it = list.iterator();
            while (it.hasNext()) {
                Element e = (Element) it.next();
                String k = e.getName();
                String v = "";
                List children = e.getChildren();
                if (children.isEmpty()) {
                    v = e.getTextNormalize();
                } else {
                    v = WXPayUtil.getChildrenText(children);
                }
                resultMap.put(k, v);
            }
            //关闭流
            // 释放资源
            inputStream.close();
            inputStream = null;
            String returnCode = resultMap.get("return_code");
            String outTradeNo = resultMap.get("out_trade_no");
            // 以分为单位
            int totalFee = Integer.parseInt(resultMap.get("total_fee"));
            logger.info("out trade no : " + outTradeNo);
            logger.info("total_fee : " + totalFee);
            // 业务处理流程
            if ("SUCCESS".equals(returnCode)) {
                Order order = new Order();
                order.setId(outTradeNo);
                Map<String, Object> map = new HashMap<>();
                map.put("order", order);
                List<Order> orders = orderService.get(map);
                order = orders.get(0);
                order.setStatus(OrderValue.PAYED);
                map.put("order", order);
                orderService.update(map);
                String msg = "success";
                response.setContentType("text/xml");
                response.getWriter().println(msg);
            } else {
                Order order = new Order();
                order.setId(outTradeNo);
                Map<String, Object> map = new HashMap<>();
                map.put("order", order);
                orderService.delete(map);
            }
        } catch (IOException ioe) {
            ioe.printStackTrace();
        } catch (JDOMException e1) {
            e1.printStackTrace();
        }
    }
}


