select 
        ts.app_or_ins as app_or_ins_num,
        d3.c_dict_nme app_or_ins,
        ts.user_id,
        c.c_clnt_nme as user_name,
        d1.c_dict_nme as papers_type,
        c.c_certf_cde as papers_no,
        -- to_char(ts.score_time, 'yyyy-mm-dd') score_time,
        d2.c_dict_nme as status,
        ts.previous_score,
        ts.bat,
        case when ts.previous_score > 90 then '高风险' when ts.previous_score > 80 then '较高风险' when ts.previous_score > 70 then '中风险' when ts.previous_score > 50 then '较低风险' else '低风险' end as for_level,
        c.c_app_no prono
from (select * 
        from (select t.user_id, t.app_or_ins,  t.bat, t.previous_score, t.status, if(@u=user_id and @i=app_or_ins,@r:=@r+1,@r:=1) as rank, @u:=user_id,@i:=app_or_ins
                from ods_amltp_t_sco t ,(select @u:=null,@i:=null, @r:=0) r order by t.user_id, t.app_or_ins,  t.bat
                ) ts 
        where rank = 1 
        ) ts join 
        (select *
        from (select t.c_clnt_cde, t.app_or_ins,  t.t_crt_tm, t.c_clnt_nme, t.c_certf_cde, t.c_app_no, t.c_certf_type, if(@u=c_clnt_cde and @i=app_or_ins,@r:=@r+1,@r:=1) as rank, @u:=c_clnt_cde,@i:=app_or_ins
                from ods_amltp_t_score t ,(select @u:=null,@i:=null, @r:=0) r order by t.c_clnt_cde, t.app_or_ins,  t.t_crt_tm
                ) c 
        where rank = 1
        ) c on c.c_clnt_cde = ts.user_id and c.app_or_ins = ts.app_or_ins
        join ods_amltp_t_dict d1 on c.c_certf_type = d1.c_dict_cde and d1.c_dict_type_cde = 'PAPERS_TYPE'
        join ods_amltp_t_dict d2 on ts.status = d2.c_dict_cde and d2.c_dict_type_cde = 'SCORE_STATUS'
        join ods_amltp_t_dict d3 on ts.app_or_ins = d3.c_dict_cde and d3.c_dict_type_cde = 'APP_OR_INS'