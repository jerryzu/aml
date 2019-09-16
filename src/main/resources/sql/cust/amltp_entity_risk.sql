insert into rpt_fxq_amltp_entity_risk(
        c_clnt_cde,
        bat,
        previous_score,
        score_time
)
select 
    user_id,
    bat,
    previous_score,
    score_time,
    first_type
from (select
        t.user_id,
        t.bat,
        t.previous_score,
        t.score_time,
        if(@u=user_id,@n:=0,@n:=1) as first_type,
        if(@u=user_id and @s=score_time,@r:=@r+1,@r:=1) as rank,
        @u:=                             user_id,
        @s:=                             score_time
    from 
        ods_amltp_t_sco t,  (select @u:=null, @s:=null, @r:=0, @n:=0) r
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