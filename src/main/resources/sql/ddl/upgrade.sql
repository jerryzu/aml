DROP TABLE `tpedw`.`t_ods_tpstic_irr_index_detail`;
create table t_ods_tpstic_irr_index_detail
(
	`index` varchar(40) COMMENT '指标编号',
	index_name varchar(400) COMMENT '指标名称',
	report_date varchar(40) COMMENT '报告期',
	index_value varchar(1000) COMMENT '因子值',
	create_time varchar(40) COMMENT '创建时间',
	update_time varchar(40) COMMENT '更新时间'
)