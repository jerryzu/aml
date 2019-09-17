alter table rpt_fxq_amltp_score truncate partition future;

insert into rpt_fxq_amltp_score(
	c_clnt_cde,
	bat,
	score,
	score_time,
	pt
)
select 
    user_id c_clnt_cde,
    bat,
    score,
    score_time,
    '{lastday}000000' pt	--	分区字段
from (select
        t.user_id,
        t.bat,
        t.previous_score score,
        t.score_time,
		--  以下用于每个打分点一条记录,处理记录重复
        if(@u=user_id and @s=score_time,@r:=@r+1,@r:=1) as rank,
        @u:=                             user_id,
        @s:=                             score_time
    from 
        ods_amltp_t_sco partition(pt{lastday}000000)  t,  (select @u:=null, @s:=null, @r:=0, @n:=0) r
    where 
        t.app_or_ins = 1 and previous_score is not null --  and t.status
    order by
        t.user_id,
        t.score_time,
        t.bat,
        t.previous_score
) v
where rank = 1
order by user_id