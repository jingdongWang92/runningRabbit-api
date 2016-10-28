package com.xiaoguo.jc.interf.test;

import java.util.Map;

import com.google.common.collect.Maps;
import com.xiaoguo.jc.common.constants.CommonConstants;
import com.xiaoguo.yo.common.util.crypto.Des;
import com.xiaoguo.yo.common.util.crypto.EncryptUtil;
import com.xiaoguo.yo.common.util.httpclient.HttpClientUtil;

public class TestHandle {

    private static final String begin = ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>begin. url:";
    private static final String end = "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<end. url:";

    private String host = null;

    // 接口通用参数
    private String test_account = null;
    private String test_v = null;
    private String test_apptype = null;

    // 展示结果
    private boolean showResult = true;

    public TestHandle(String host, String account, String v, String apptype, boolean showResult) {
        this.host = host;
        this.test_account = account;
        this.test_v = v;
        this.test_apptype = apptype;
        this.showResult = showResult;
    }

    /**    */

    String getHost() {
        return this.host;
    }

    public static String encrypt(String account) throws Exception {
        return Des.encryptDES(account, CommonConstants.DES_KEY);
    }

    String sign(Map<String, String> paramMap) throws Exception {
        return EncryptUtil.signature2(paramMap, CommonConstants.SECRET_CODE, true, false,
                CommonConstants.PARAMTER_SIGN);
    }

    public void test(String _url, Map<String, String> _paramMap) throws Exception {
        String url = getHost() + _url;
        Map<String, String> paramMap = getNewParamMap();

        if (null != _paramMap && !_paramMap.isEmpty()) {
            paramMap.putAll(_paramMap);
        }

        setSign(paramMap);

        showResult(url, paramMap);
    }

    void showResult(String url, Map<String, String> paramMap) {
        String respStr = HttpClientUtil.sendPostRequest(url, paramMap, null, null);
        if (showResult) {
            System.out.println(begin + url);
            System.out.println(respStr);
            System.out.println(end + url);
            System.out.println();
        }
    }

    Map<String, String> getNewParamMap() throws Exception {
        Map<String, String> paramMap = Maps.newHashMap();
        paramMap.put("timestamp", System.currentTimeMillis() + "");
        paramMap.put("v", test_v);
        paramMap.put("apptype", test_apptype);
        paramMap.put("account", encrypt(test_account));
        return paramMap;
    }

    void setSign(Map<String, String> paramMap) throws Exception {
        paramMap.put("sign", sign(paramMap));
    }
}
