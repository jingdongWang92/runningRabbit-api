package com.xiaoguo.jc.interf.controller.rabbit;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaoguo.jc.common.dto.request.rabbit.CatchRabbitReqDto;
import com.xiaoguo.jc.common.dto.request.rabbit.GetRabbitListReqDto;
import com.xiaoguo.jc.common.dto.response.BaseRespDto;
import com.xiaoguo.jc.common.dto.response.rabbit.GetRabbitListRespDto;
import com.xiaoguo.jc.common.service.exception.JcServiceException;
import com.xiaoguo.jc.common.service.rabbit.RabbitService;
import com.xiaoguo.jc.interf.controller.BaseController;

/**
 * 兔子相关
 * 
 * @author yjc
 *
 */
@Controller
@RequestMapping("/rabbit")
public class RabbitController extends BaseController {

    @Autowired
    private RabbitService rabbitService;

    /**
     * 11、兔子列表
     * 
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "getRabbitList", method = RequestMethod.POST)
    @ResponseBody
    public GetRabbitListRespDto getRabbitList(GetRabbitListReqDto baseReq, HttpServletRequest request)
            throws Exception {
        GetRabbitListRespDto resp = new GetRabbitListRespDto();
        try {
            if (baseReq == null || StringUtils.isBlank(baseReq.getAccount())) {
                throw new JcServiceException(JcServiceException.ERROR_10001);
            }
            resp = rabbitService.getRabbitList(baseReq);
        } catch (Exception e) {
            throw e;
        }
        return resp;
    }

    /**
     * 12、捕捉一只兔子
     * 
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "catchRabbit", method = RequestMethod.POST)
    @ResponseBody
    public BaseRespDto catchRabbit(CatchRabbitReqDto baseReq, HttpServletRequest request) throws Exception {
        BaseRespDto resp = new BaseRespDto();
        try {
            if (baseReq == null || StringUtils.isBlank(baseReq.getAccount())) {
                throw new JcServiceException(JcServiceException.ERROR_10001);
            }

            resp = rabbitService.catchRabbit(baseReq);

        } catch (Exception e) {
            throw e;
        }
        return resp;
    }
}
