package com.xiaoguo.jc.interf.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaoguo.jc.common.constants.CommonConstants;
import com.xiaoguo.jc.common.dto.request.token.UptokenReqDto;
import com.xiaoguo.jc.common.dto.response.BaseRespDto;
import com.xiaoguo.jc.common.dto.response.token.UptokenRespDto;
import com.xiaoguo.jc.common.enums.UploadEnum;
import com.xiaoguo.jc.common.service.exception.JcServiceException;
import com.xiaoguo.jc.common.service.qncloud.QiniuCloudApiService;
import com.xiaoguo.jc.common.utils.UploadNamesUtils;
import com.xiaoguo.yo.common.util.crypto.Des;

/**
 * 所有控制器的基类：存放所有公共方法
 * 
 * @author Administrator
 * 
 */
public abstract class BaseController {
    /** logger */
    protected static final Logger logger = LoggerFactory.getLogger(BaseController.class);

    @Autowired
    private QiniuCloudApiService qiniuCloudApiService;

    /**
     * 上传文件获取上传uptoken信息
     * 
     * @param uptoken
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "getUptoken", method = RequestMethod.POST)
    @ResponseBody
    protected BaseRespDto getUptoken(UptokenReqDto uptoken, HttpServletRequest request) throws Exception {
        UptokenRespDto resp = new UptokenRespDto();
        try {
            String account = uptoken.getAccount();
            String type = uptoken.getType();
            String filePrefix = UploadEnum.ServiceType.codeMap.get(type);// 文件前缀
            // 校验请求参数
            if (StringUtils.isBlank(account) || StringUtils.isBlank(type) || StringUtils.isBlank(filePrefix)) {
                throw new JcServiceException(JcServiceException.ERROR_10001);
            }

            // 调用接口获取上传token
            String uptokenStr = qiniuCloudApiService.getUpToken();
            resp.setUptoken(uptokenStr);
            // 获取上传文件名称
            account = Des.decryptDES(account, CommonConstants.DES_KEY);
            String filename = UploadNamesUtils.getUploadFileName(filePrefix, account);
            resp.setFname(filename);
        } catch (Exception e) {
            throw e;
        }
        // 记录响应日志
        this.noteRespResult(request, resp);

        return resp;
    }

    /**
     * 记录响应日志
     * 
     * @param request
     * @param resp
     */
    protected void noteRespResult(HttpServletRequest request, BaseRespDto resp) {
        logger.info(request.getRequestURI() + " resp====>" + resp.toString());
    }

    /**
     * 全局异常处理
     * 
     * @param request
     * @param ex
     * @return
     */
    @ExceptionHandler
    @ResponseBody
    public BaseRespDto handleException(HttpServletRequest request, Exception ex) {
        BaseRespDto resp = new BaseRespDto();
        JcServiceException JcServiceException = null;
        if (ex instanceof JcServiceException) {
            JcServiceException = (JcServiceException) ex;
        } else {
            JcServiceException = new JcServiceException(JcServiceException.ERROR_10000);
        }
        resp.setRespCode(JcServiceException.getErroCode());
        resp.setRespMsg(JcServiceException.getErroDesc());

        logger.error("HandleException===>" + request.getRequestURI() + " response error:" + resp.toString());
        return resp;
    }
}
