package com.xiaoguo.jc.interf.controller.merchant;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaoguo.jc.common.dto.request.merchant.BaseMerchantReqDto;
import com.xiaoguo.jc.common.dto.request.merchant.GetCouponDetailReqDto;
import com.xiaoguo.jc.common.dto.request.merchant.GetWriteOffListReqDto;
import com.xiaoguo.jc.common.dto.request.merchant.WriteOffReqDto;
import com.xiaoguo.jc.common.dto.response.BaseRespDto;
import com.xiaoguo.jc.common.dto.response.merchant.GetCouponDetailRespDto;
import com.xiaoguo.jc.common.dto.response.merchant.GetWriteOffListRespDto;
import com.xiaoguo.jc.common.service.merchant.MerchantService;
import com.xiaoguo.jc.interf.controller.BaseController;

/**
 * 商户端接口列表 yjc
 */
@Controller
@RequestMapping("/merchant")
public class MerchantController extends BaseController {

    @Autowired
    private MerchantService merchantService;

    /**
     * 3、用户登录接口
     * 
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "login", method = RequestMethod.POST)
    @ResponseBody
    public BaseRespDto login(BaseMerchantReqDto baseReq, HttpServletRequest request) throws Exception {
        BaseRespDto resp = new BaseRespDto();
        try {
            resp = merchantService.login(baseReq);
            return resp;
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * 4、获取奖劵详细信息接口
     * 
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "getCouponDetail", method = RequestMethod.POST)
    @ResponseBody
    public GetCouponDetailRespDto getCouponDetail(GetCouponDetailReqDto baseReq, HttpServletRequest request)
            throws Exception {
        GetCouponDetailRespDto resp = new GetCouponDetailRespDto();
        try {
            resp = merchantService.getCouponDetail(baseReq);
            return resp;
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * 5、核销奖券
     * 
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "writeOff", method = RequestMethod.POST)
    @ResponseBody
    public BaseRespDto writeOff(WriteOffReqDto baseReq, HttpServletRequest request) throws Exception {
        BaseRespDto resp = new BaseRespDto();
        try {
            resp = merchantService.writeOff(baseReq);
            return resp;
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * 6、获取核销奖券记录
     * 
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "getWriteOffList", method = RequestMethod.POST)
    @ResponseBody
    public GetWriteOffListRespDto getWriteOffList(GetWriteOffListReqDto baseReq, HttpServletRequest request)
            throws Exception {
        GetWriteOffListRespDto resp = new GetWriteOffListRespDto();
        try {
            resp = merchantService.getWriteOffList(baseReq);
            return resp;
        } catch (Exception e) {
            throw e;
        }
    }
}
