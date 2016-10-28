package com.xiaoguo.jc.interf.test.main;

import java.util.Map;

import com.google.common.collect.Maps;
import com.xiaoguo.jc.interf.test.TestHandle;

public class Test_scrap {

    // final String host = "http://192.168.1.48:32773/";
    private String host = "http://192.168.1.45:8080/twotwo_interf/";
    // private String host = "http://192.168.1.48:32773/";

    // 接口通用参数
    private String test_account = "jiekouceshi_main";
    private String test_v = "1.0.0";
    private String test_apptype = "2";
    // 是否打印接口返回结果
    private boolean showResult = true;

    private TestHandle testHandle = new TestHandle(host, test_account, test_v, test_apptype, showResult);

    @org.junit.Test
    public void test_login() throws Exception {
        String _url = "user/login.do";

        Map<String, String> paramMap = Maps.newHashMap();
        paramMap.put("name", "test_main");
        paramMap.put("pic", "");

        testHandle.test(_url, paramMap);

    }

    @org.junit.Test
    public void test_user_putRegisterJPush() throws Exception {
        String _url = "user/putRegisterJPush.do";

        Map<String, String> paramMap = Maps.newHashMap();
        paramMap.put("registrationid", "123456789");

        testHandle.test(_url, paramMap);
    }

    @org.junit.Test
    public void test_getRabbitList() throws Exception {
        String _url = "rabbit/getRabbitList.do";

        Map<String, String> paramMap = Maps.newHashMap();
        paramMap.put("x", "123456789");
        paramMap.put("y", "1212");

        testHandle.test(_url, paramMap);
    }

    @org.junit.Test
    public void test_catchRabbit() throws Exception {
        String _url = "rabbit/catchRabbit.do";

        Map<String, String> paramMap = Maps.newHashMap();
        paramMap.put("aid", "2");
        paramMap.put("rabbitId", "1");

        testHandle.test(_url, paramMap);
    }

    @org.junit.Test
    public void test_getCouponList() throws Exception {
        String _url = "coupon/getCouponList.do";

        Map<String, String> paramMap = Maps.newHashMap();
        paramMap.put("status", "1");
        paramMap.put("pageIndex", "1");
        paramMap.put("pageSize", "5");

        testHandle.test(_url, paramMap);
    }

    /**
     * 7、获取我的优惠劵信息列表接口
     * 
     * @throws Exception
     */
    @org.junit.Test
    public void test_getMyCouponList() throws Exception {
        String _url = "coupon/getMyCouponList.do";

        Map<String, String> paramMap = Maps.newHashMap();
        paramMap.put("pageIndex", "1");
        paramMap.put("pageSize", "5");

        testHandle.test(_url, paramMap);
    }

    /**
     * 9、提交领取优惠券接口
     * 
     * @throws Exception
     */
    @org.junit.Test
    public void test_putDoleCoupon() throws Exception {
        String _url = "coupon/putDoleCoupon.do";

        Map<String, String> paramMap = Maps.newHashMap();
        paramMap.put("couponId", "1");

        testHandle.test(_url, paramMap);
    }

    /**
     * 10、使用我的优惠券接口
     * 
     * @throws Exception
     */
    @org.junit.Test
    public void test_useCoupon() throws Exception {
        String _url = "coupon/useCoupon.do";

        Map<String, String> paramMap = Maps.newHashMap();
        paramMap.put("couponId", "5");

        testHandle.test(_url, paramMap);
    }

    @org.junit.Test
    public void test_rankingList() throws Exception {
        String _url = "user/rankingList.do";

        Map<String, String> paramMap = Maps.newHashMap();

        testHandle.test(_url, paramMap);
    }

}
