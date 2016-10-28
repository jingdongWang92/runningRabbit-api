package com.xiaoguo.jc.interf.test.main;

import com.xiaoguo.jc.interf.test.TestBase;
import com.xiaoguo.jc.interf.test.TestHandle;
import com.xiaoguo.jc.interf.test.TestParamMap;
import com.xiaoguo.yo.common.util.crypto.MD5;

public class TestMain extends TestBase {

    // final String host = "http://192.168.1.48:32773/";
//    private String host = "http://two2go.apis.jcbel.com/";
    private String host = "http://localhost:8081/twotwogo-interf/";
//    private String host = "http://192.168.1.45:8080/twotwo_interf/";
    // private String host = "http://192.168.1.45:8081/twotwo_interf/";

    // 接口通用参数
    private String test_account = "jiekouceshi_main";
    private String test_v = "1.0.0";
    private String test_apptype = "2";
    // 是否打印接口返回结果
    private boolean showResult = true;

    private TestHandle testHandle = null;

    @Override
    public TestHandle getTestHandle() {
        if (null == testHandle) {
            testHandle = new TestHandle(host, test_account, test_v, test_apptype, showResult);
        }
        return testHandle;
    }
    
    /**
     * 3、用户登录接口
     * 
     * @throws Exception
     */
    @org.junit.Test
    public void test_login() throws Exception {
        test("user/login.do", new TestParamMap() {
            @Override
            public void setValue() {
                V("name", "test_main");
                V("pic", "");
            }
        });
    }

    @org.junit.Test
    public void test_user_putRegisterJPush() throws Exception {
        test("user/putRegisterJPush.do", new TestParamMap() {
            @Override
            public void setValue() {
                V("registrationid", System.currentTimeMillis() + "");
            }
        });
    }

    /**
     * 6、获取优惠劵信息列表接口
     * 
     * @throws Exception
     */
    @org.junit.Test
    public void test_getCouponList() throws Exception {
        test("coupon/getCouponList.do", new TestParamMap() {
            @Override
            public void setValue() {
                V("act_id", "2");
                // V("status", "1");
                V("pageIndex", "1");
                V("pageSize", "5");
            }
        });
    }

    /**
     * 7、获取我的优惠劵信息列表接口
     * 
     * @throws Exception
     */
    @org.junit.Test
    public void test_getMyCouponList() throws Exception {
        test("coupon/getMyCouponList.do", new TestParamMap() {
            @Override
            public void setValue() {
                V("pageIndex", "1");
                V("pageSize", "5");
            }
        });
    }

    /**
     * 9、提交领取优惠券接口
     * 
     * @throws Exception
     */
    @org.junit.Test
    public void test_putDoleCoupon() throws Exception {
        test("coupon/putDoleCoupon.do", new TestParamMap() {
            @Override
            public void setValue() {
                V("couponId", "1");
            }
        });
    }

    /**
     * 10、使用我的优惠券接口
     * 
     * @throws Exception
     */
    @org.junit.Test
    public void test_useCoupon() throws Exception {
        test("coupon/useCoupon.do", new TestParamMap() {
            @Override
            public void setValue() {
                V("couponId", "5");
            }
        });
    }

    /**
     * 11、兔子列表
     * 
     * @throws Exception
     */
    @org.junit.Test
    public void test_getRabbitList() throws Exception {
        test("rabbit/getRabbitList.do", new TestParamMap() {
            @Override
            public void setValue() {
                V("accunt", "o0E2OwK1I3NFJUHc1N_lbhrrLj_o");
                V("x", "106.568892");
                V("y", "29.55275");
            }
        });
    }

    /**
     * 12、捕捉一只兔子
     * 
     * @throws Exception
     */
    @org.junit.Test
    public void test_catchRabbit() throws Exception {
        test("rabbit/catchRabbit.do", new TestParamMap() {
            @Override
            public void setValue() {
                V("aid", "2");
                V("rabbitId", "14");
            }
        });
    }

    /**
     * 13、排行榜
     * 
     * @throws Exception
     */
    @org.junit.Test
    public void test_rankingList() throws Exception {
        test("user/rankingList.do");
    }

    /**
     * 5、获取广告位信息列表
     * 
     * @throws Exception
     */
    @org.junit.Test
    public void test_getLefletList() throws Exception {
        test("leaflet/getLefletList.do");
    }

    /**
     * 15、获取我的信息
     * 
     * @throws Exception
     */
    @org.junit.Test
    public void test_getMyInfo() throws Exception {
        test("user/getMyInfo.do");
    }

    /**
     * 3、用户登录接口
     * 
     * @throws Exception
     */
    @org.junit.Test
    public void merchant_login() throws Exception {
        test("merchant/login.do", new TestParamMap() {
            @Override
            public void setValue() {
                try {
                    V("account", TestHandle.encrypt("admin"));
                    V("password", TestHandle.encrypt(MD5.encrypt("admin")));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /**
     * 4、获取奖劵详细信息接口
     * 
     * @throws Exception
     */
    @org.junit.Test
    public void merchant_getCouponDetail() throws Exception {
        test("merchant/getCouponDetail.do", new TestParamMap() {
            @Override
            public void setValue() {
                try {
                    V("account", TestHandle.encrypt("admin"));
                    V("password", TestHandle.encrypt(MD5.encrypt("admin")));
                    V("code", "UEPHPL");
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /**
     * 5、核销奖券
     * 
     * @throws Exception
     */
    @org.junit.Test
    public void merchant_writeOff() throws Exception {
        test("merchant/writeOff.do", new TestParamMap() {
            @Override
            public void setValue() {
                try {
                    V("account", TestHandle.encrypt("admin"));
                    V("password", TestHandle.encrypt(MD5.encrypt("admin")));
                    V("code", "UEPHPL");
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /**
     * 6、获取核销奖券记录
     * 
     * @throws Exception
     */
    @org.junit.Test
    public void merchant_getWriteOffList() throws Exception {
        test("merchant/getWriteOffList.do", new TestParamMap() {
            @Override
            public void setValue() {
                try {
                    V("account", TestHandle.encrypt("admin"));
                    V("password", TestHandle.encrypt(MD5.encrypt("admin")));
                    V("pageIndex", "1");
                    V("pageSize", "5");
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }
    

    /**
     * 获取所有活动
     * @throws Exception
     */
    @org.junit.Test
    public void test_getActivityList() throws Exception {
      test("coupon/getActivities.do");
    }

}
