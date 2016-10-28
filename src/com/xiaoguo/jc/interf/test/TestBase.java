package com.xiaoguo.jc.interf.test;

import java.util.Map;

public abstract class TestBase {

    protected void test(String url, TestParam testParam) throws Exception {
        this.getTestHandle().test(url, testParam.get());
    }

    protected void test(String url, Map<String, String> param) throws Exception {
        this.getTestHandle().test(url, param);
    }

    protected void test(String url) throws Exception {
        this.getTestHandle().test(url, null);
    }

    protected abstract TestHandle getTestHandle();
}
