-- 活动添加地址坐标
alter table t_activity add COLUMN x varchar(32);
alter table t_activity add COLUMN y varchar(32);

-- 我的奖券增加地址
alter table t_coupon add COLUMN activityAddress varchar(200);
