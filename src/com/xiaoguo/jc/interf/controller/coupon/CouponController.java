package com.xiaoguo.jc.interf.controller.coupon;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaoguo.jc.common.dto.request.BaseReqDto;
import com.xiaoguo.jc.common.dto.request.coupon.GetCouponDetailReqDto;
import com.xiaoguo.jc.common.dto.request.coupon.GetCouponListReqDto;
import com.xiaoguo.jc.common.dto.request.coupon.PutDoleCouponReqDto;
import com.xiaoguo.jc.common.dto.request.coupon.UseCouponReqDto;
import com.xiaoguo.jc.common.dto.response.BaseRespDto;
import com.xiaoguo.jc.common.dto.response.coupon.GetActivityListRespDto;
import com.xiaoguo.jc.common.dto.response.coupon.GetCouponDetailRespDto;
import com.xiaoguo.jc.common.dto.response.coupon.GetCouponListRespDto;
import com.xiaoguo.jc.common.service.activity.ActivityService;
import com.xiaoguo.jc.common.service.coupon.CouponInfoService;
import com.xiaoguo.jc.common.service.exception.JcServiceException;
import com.xiaoguo.jc.interf.controller.BaseController;

/**
 * 优惠券相关
 * 
 * @author yjc
 *
 */
@Controller
@RequestMapping("/coupon")
public class CouponController extends BaseController {

    @Autowired
    private CouponInfoService couponInfoService;
    @Autowired
    private ActivityService activityService;

    /**
     * 6、获取优惠劵信息列表接口
     * 
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "getCouponList", method = RequestMethod.POST)
    @ResponseBody
    public GetCouponListRespDto getCouponList(GetCouponListReqDto baseReq, HttpServletRequest request)
            throws Exception {
        GetCouponListRespDto resp = new GetCouponListRespDto();
        try {
            if (baseReq == null || StringUtils.isBlank(baseReq.getAccount())) {
                throw new JcServiceException(JcServiceException.ERROR_10001);
            }

            resp = couponInfoService.getCouponList(baseReq);

        } catch (Exception e) {
            throw e;
        }
        return resp;
    }

    /**
     * 7、获取我的优惠劵信息列表接口
     * 
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "getMyCouponList", method = RequestMethod.POST)
    @ResponseBody
    public GetCouponListRespDto getMyCouponList(GetCouponListReqDto baseReq, HttpServletRequest request)
            throws Exception {
        GetCouponListRespDto resp = new GetCouponListRespDto();
        try {
            if (baseReq == null || StringUtils.isBlank(baseReq.getAccount())) {
                throw new JcServiceException(JcServiceException.ERROR_10001);
            }

            resp = couponInfoService.getMyCouponList(baseReq);

        } catch (Exception e) {
            throw e;
        }
        return resp;
    }

    /**
     * 8、获取优惠劵详细信息接口
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
            if (baseReq == null || StringUtils.isBlank(baseReq.getAccount())) {
                throw new JcServiceException(JcServiceException.ERROR_10001);
            }

            resp = couponInfoService.getCouponDetail(baseReq);

        } catch (Exception e) {
            throw e;
        }
        return resp;
    }

    /**
     * 9、提交领取优惠券接口
     * 
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "putDoleCoupon", method = RequestMethod.POST)
    @ResponseBody
    public BaseRespDto putDoleCoupon(PutDoleCouponReqDto baseReq, HttpServletRequest request) throws Exception {
        BaseRespDto resp = new BaseRespDto();
        try {
            if (baseReq == null || StringUtils.isBlank(baseReq.getAccount())) {
                throw new JcServiceException(JcServiceException.ERROR_10001);
            }

            resp = couponInfoService.putDoleCoupon(baseReq);

        } catch (Exception e) {
            throw e;
        }
        return resp;
    }

    /**
     * 10、使用我的优惠券接口
     * 
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "useCoupon", method = RequestMethod.POST)
    @ResponseBody
    public BaseRespDto useCoupon(UseCouponReqDto baseReq, HttpServletRequest request) throws Exception {
        BaseRespDto resp = new BaseRespDto();
        try {
            if (baseReq == null || StringUtils.isBlank(baseReq.getAccount())) {
                throw new JcServiceException(JcServiceException.ERROR_10001);
            }

            resp = couponInfoService.useCoupon(baseReq);

        } catch (Exception e) {
            throw e;
        }
        return resp;
    }

    /**
     * 14、获取有效期活动列表
     * 
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "getActivityList", method = RequestMethod.POST)
    @ResponseBody
    public GetActivityListRespDto getActivityList(BaseReqDto baseReq, HttpServletRequest request) throws Exception {
        GetActivityListRespDto resp = new GetActivityListRespDto();
        try {
            if (baseReq == null || StringUtils.isBlank(baseReq.getAccount())) {
                throw new JcServiceException(JcServiceException.ERROR_10001);
            }
            resp = activityService.getActivityList(baseReq);
        } catch (Exception e) {
            throw e;
        }
        return resp;
    }
    
    /**
     * 15、获取活动列表
     * 
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "getActivities", method = RequestMethod.POST)
    @ResponseBody
    public GetActivityListRespDto getActivities(BaseReqDto baseReq, HttpServletRequest request) throws Exception {
    	GetActivityListRespDto resp = new GetActivityListRespDto();
    	try {
    		if (baseReq == null || StringUtils.isBlank(baseReq.getAccount())) {
    			throw new JcServiceException(JcServiceException.ERROR_10001);
    		}
    		resp = activityService.getActivities(baseReq);
    	} catch (Exception e) {
    		throw e;
    	}
    	return resp;
    }
}
