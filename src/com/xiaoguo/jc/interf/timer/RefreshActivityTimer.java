package com.xiaoguo.jc.interf.timer;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.xiaoguo.jc.common.model.activity.ActivityDto;
import com.xiaoguo.jc.common.service.activity.ActivityService;
import com.xiaoguo.jc.common.service.rabbit.impl.RabbitRel;

/**
 * 检查预约信息定时器
 * 
 * @author yjc
 *
 */
@Component
public class RefreshActivityTimer {

    private static final Logger logger = LoggerFactory.getLogger(RefreshActivityTimer.class);

    @Autowired
    private ActivityService activityService;

    private static Map<Integer, Long> map = new ConcurrentHashMap<>();

    public void execute() {
        // logger.info("<<<==============================refresh.activity.timer
        // start.");
        long nowTimes = System.currentTimeMillis();
        try {
            List<ActivityDto> list = activityService.queryValidActivityList();
            if (null != list && !list.isEmpty()) {
                for (ActivityDto activityDto : list) {
                    // 上一次刷新的时间
                    Long times = map.get(activityDto.getId());
                    if (null == times) {
                        times = nowTimes;
                        map.put(activityDto.getId(), nowTimes);
                    }

                    // 活动中设置的刷新间隔 分钟数
                    Integer inteval = activityDto.getRefreshTime();
                    if (null == inteval) {
                        inteval = 0;
                    }

                    // 计算出来上次更新到现在的间隔分钟数
                    long minute = (nowTimes - times) / (1000 * 60);
                    if (minute >= inteval) {
                        logger.info("==============================refresh.activity.timer clear. activity.id="
                                + activityDto.getId());
                        RabbitRel.getSingleton().clear(activityDto.getId());
                        map.put(activityDto.getId(), nowTimes);
                    }
                }
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        // logger.info(">>>==============================refresh.activity.timer
        // end.");
    }

    public static void main(String[] args) {
        Calendar dateOne = Calendar.getInstance(), dateTwo = Calendar.getInstance();
        dateOne.setTime(new Date()); // 设置为当前系统时间
        dateTwo.set(2015, 0, 25); // 设置为2015年1月15日
        long nowTimes = dateOne.getTimeInMillis();
        long timeTwo = dateTwo.getTimeInMillis();
        long minute = (nowTimes - timeTwo) / (1000 * 60);// 转化minute
        System.out.println("相隔" + minute + "分钟");
    }
}
