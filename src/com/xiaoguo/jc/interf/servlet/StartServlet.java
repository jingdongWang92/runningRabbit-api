package com.xiaoguo.jc.interf.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import baseproj.common.util.LoggerUtil;

import com.xiaoguo.jc.common.constants.CommonConstants;
import com.xiaoguo.jc.common.utils.GetWebConfig;

/**
 * 启动初始化系统参数
 * 
 * @author Administrator
 * 
 */
public class StartServlet extends HttpServlet {
    private static final long serialVersionUID = 8116219822239884792L;

    protected static final Logger logger = LoggerFactory.getLogger(StartServlet.class);

    /**
     * 系统初始化
     * 
     * 
     * @return
     * @throws
     */
    @Override
    public void init() throws ServletException {
        String version = CommonConstants.DEFAULT_VERSION;
        String result = "failed";
        try {
            // 初始化配置信息
            GetWebConfig.init();

            // 获取门户版本信息
            String cfgVersion = GetWebConfig.getValue("version");
            if (StringUtils.isBlank(cfgVersion)) {
                logger.warn("no config system version,user default version,v===>" + version);
            } else {
                version = cfgVersion;
            }

            result = "success";
            logger.info("\n********* jc-interf initialize all config successful! *********");
        } catch (Exception ex) {
            logger.error("\n********* jc-interf initialize fail! *********", ex);
            throw new ServletException(ex);
        } finally {
            // 将启动的日志记录到tomcat/logs/version.txt中
            LoggerUtil.writeStartLog("jc-interf start " + result + "! Version: " + version + "\n");
        }
    }

    /**
     * Destroy.
     * 
     * @version
     */
    @Override
    public void destroy() {
    }
}
