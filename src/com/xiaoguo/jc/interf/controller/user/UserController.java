package com.xiaoguo.jc.interf.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaoguo.jc.common.dto.request.BaseReqDto;
import com.xiaoguo.jc.common.dto.request.user.JPushReqDto;
import com.xiaoguo.jc.common.dto.request.user.UserLoginReqDto;
import com.xiaoguo.jc.common.dto.response.BaseRespDto;
import com.xiaoguo.jc.common.dto.response.user.GetMyInfoRespDto;
import com.xiaoguo.jc.common.dto.response.user.RankingListRespDto;
import com.xiaoguo.jc.common.service.exception.JcServiceException;
import com.xiaoguo.jc.common.service.user.UserService;
import com.xiaoguo.jc.interf.controller.BaseController;

/**
 * 用户模块
 * 
 * @author yjc
 * 
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
    @Autowired
    private UserService userService;
    // @Autowired
    // private AdvertisingService advertisingService;

    /**
     * 3、 用户登录接口
     * 
     * @param request
     *            * @return
     * @throws Exception
     */
    @RequestMapping(value = "login", method = RequestMethod.POST)
    @ResponseBody
    public BaseRespDto login(UserLoginReqDto userLoginReq, HttpServletRequest request) throws Exception {
        BaseRespDto resp = new BaseRespDto();
        try {
            if (userLoginReq == null || StringUtils.isBlank(userLoginReq.getAccount())) {
                throw new JcServiceException(JcServiceException.ERROR_10001);
            }

            resp = userService.login(userLoginReq);
        } catch (Exception e) {
            throw e;
        }
        return resp;
    }

    /**
     * 4、 提交极光用户注册ID接口
     * 
     * @param jPushReq
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "putRegisterJPush", method = RequestMethod.POST)
    @ResponseBody
    public BaseRespDto putRegisterJPush(JPushReqDto jPushReq, HttpServletRequest request) throws Exception {
        BaseRespDto resp = new BaseRespDto();
        try {
            // 参数校验
            if (StringUtils.isBlank(jPushReq.getAccount()) || StringUtils.isBlank(jPushReq.getRegistrationid())) {
                throw new JcServiceException(JcServiceException.ERROR_10001);
            }

            userService.updateUserJPushid(jPushReq);
        } catch (Exception e) {
            throw e;
        }
        return resp;
    }

    /**
     * 13、排行榜
     * 
     * @param baseReq
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "rankingList", method = RequestMethod.POST)
    @ResponseBody
    public RankingListRespDto rankingList(BaseReqDto baseReq, HttpServletRequest request) throws Exception {
        RankingListRespDto resp = new RankingListRespDto();
        try {
            // 参数校验
            if (StringUtils.isBlank(baseReq.getAccount())) {
                throw new JcServiceException(JcServiceException.ERROR_10001);
            }

            resp = userService.rankingList(baseReq);
        } catch (Exception e) {
            throw e;
        }
        return resp;
    }

    /**
     * 15、获取我的信息
     * 
     * @param baseReq
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "getMyInfo", method = RequestMethod.POST)
    @ResponseBody
    public GetMyInfoRespDto getMyInfo(BaseReqDto baseReq, HttpServletRequest request) throws Exception {
        GetMyInfoRespDto resp = new GetMyInfoRespDto();
        try {
            // 参数校验
            if (StringUtils.isBlank(baseReq.getAccount())) {
                throw new JcServiceException(JcServiceException.ERROR_10001);
            }

            resp = userService.getMyInfo(baseReq);
        } catch (Exception e) {
            throw e;
        }
        return resp;
    }

    // /**
    // * 5、获取广告位信息列表
    // *
    // * @param request
    // * @return
    // * @throws Exception
    // */
    // @RequestMapping(value = "getAdvertisingList", method =
    // RequestMethod.POST)
    // @ResponseBody
    // public BaseRespDto getAdvertisingList(AdvertisingReqDto advertisingReq,
    // HttpServletRequest request)
    // throws Exception {
    // BaseRespDto resp = new BaseRespDto();
    // try {
    // if (advertisingReq == null ||
    // StringUtils.isBlank(advertisingReq.getAccount())
    // ||
    // !AdvertisingEnum.Location.codeMap.containsKey(advertisingReq.getLocation()))
    // {
    // throw new JcServiceException(JcServiceException.ERROR_10001);
    // }
    //
    // resp = advertisingService.queryAdvertisingList(advertisingReq);
    // } catch (Exception e) {
    // throw e;
    // }
    // return resp;
    // }

}
