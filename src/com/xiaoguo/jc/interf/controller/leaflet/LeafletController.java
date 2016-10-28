package com.xiaoguo.jc.interf.controller.leaflet;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaoguo.jc.common.dto.request.BaseReqDto;
import com.xiaoguo.jc.common.dto.response.leaflet.GetLeafletListRespDto;
import com.xiaoguo.jc.common.service.exception.JcServiceException;
import com.xiaoguo.jc.common.service.leaflet.LeafletService;
import com.xiaoguo.jc.interf.controller.BaseController;

/**
 * 广告模块
 * 
 * @author yjc
 * 
 */
@Controller
@RequestMapping("/leaflet")
public class LeafletController extends BaseController {
    @Autowired
    private LeafletService leafletService;

    /**
     * 5、获取广告位信息列表
     * 
     * @param baseReq
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "getLefletList", method = RequestMethod.POST)
    @ResponseBody
    public GetLeafletListRespDto getLefletList(BaseReqDto baseReq, HttpServletRequest request) throws Exception {
        GetLeafletListRespDto resp = new GetLeafletListRespDto();
        try {
            // 参数校验
            if (StringUtils.isBlank(baseReq.getAccount())) {
                throw new JcServiceException(JcServiceException.ERROR_10001);
            }

            resp = leafletService.getLefletList(baseReq);
        } catch (Exception e) {
            throw e;
        }
        return resp;
    }

}
