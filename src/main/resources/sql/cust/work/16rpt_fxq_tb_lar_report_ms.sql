alter table rpt_fxq_tb_lar_report_ms truncate partition future;

insert into rpt_fxq_tb_lar_report_ms(
    ricd,
    finc,
    sbdt,
    cttn,
    code,
    rlfc,
    ctnm,
    citp,
    oitp,
    ctid,
    csnm,
    catp,
    ctac,
    cbct,
    ocbt,
    cbcn,
    ctvc,
    cctl,
    ccei,
    ctar,
    ctnt,
    oatm,
    crcd,
    tbnm,
    tbit,
    tbid,
    tbnt,
    tstm,
    trcd,
    ticd,
    rpmt,
    rpmn,
    tstp,
    tsct,
    tsdr,
    crpp,
    crtp,
    crat,
    crmb,
    cusd,
    ttnm,
    cfin,
    cfct,
    cfic,
    cfrc,
    tcnm,
    tcit,
    tcid,
    tcat,
    tcac,
    octt,
    ooct,
    ocec,
    rotf,
    pt
)
select
    'f1008933000019'		ricd	  --  	报告机构编码
    ,'f1008933000019'		finc	  --  	金融机构代码
    ,c.trans_date		sbdt	  --  	大额交易提取时间
    ,null		cttn	  --  	大额交易客户总数 -- '计数'
    ,null		code	  --  	案例编号 -- 每份大额交易报告的唯一编号
    ,t.rltp		rlfc	  --  	金融机构与客户关系 --  00:客户通过在境内金融机构开立账户或银行卡发生的交易 "金融机构"为开立账户的机构或发卡银行; 01:客户通过境外银行卡所发生的交易 "金融机构"为收单行; 02:客户不通过账户或银行卡发生的交易,"金融机构"为办理业务机构
    ,c.real_name		ctnm	  --  	客户姓名名称
    ,c.certi_type		citp	  --  	客户身份证件证明文件类型
    ,c.certi_type		oitp	  --  	其他身份证件/证明文件类型
    ,c.certi_code		ctid	  --  	客户身份证件/证明文件号码
    ,c.customer_id		csnm	  --  	客户号
    ,t.catp		catp	  --  	客户账户类型
    ,t.ctac		ctac	  --  	客户账号
    ,t.ctac		cbct	  --  	客户银行卡类型 --  10:借记卡;20:贷记卡;30:准贷记卡;90:其他;
    ,null		ocbt	  --  	客户银行卡其他类型 --  如果字段"客户银行卡类型"为90此项必填 否则为@N
    ,t.ctac		cbcn	  --  	客户银行卡号码
    ,null		ctvc	  --  	客户职业(对私)或客户职业(对公) -- 若失业则填99999
    ,null		cctl	  --  	客户联系电话
    ,null		ccei	  --  	客户其他联系方式
    ,null		ctar	  --  	客户住址/经营地址
    ,'CHN'		ctnt	  --  	国籍
    ,null		oatm	  --  	客户账户开立时间
    ,d.crcd		crcd	  --  	大额交易特征代码 -- 参考中国人民银行关于印发证券期货保险机构反洗钱执法检查数据提取接口规范的通知-银发【2019】63号'
    ,t.tbnm		tbnm	  --  	交易代办人姓名
    ,t.tbit		tbit	  --  	交易代办人身份证件/证明文件类型
    ,t.tbid		tbid	  --  	交易代办人身份证件/证明文件号码
    ,t.tbnt		tbnt	  --  	交易代办人国籍
    ,c.trans_date		tstm	  --  	交易时间  --  年年年年月月日日时时分分秒秒
    ,'CHN330104'		trcd	  --  	交易发生地
    ,t.ticd		ticd	  --  	业务标识号
    ,null		rpmt	  --  	收付款方匹配号类型
    ,null		rpmn	  --  	收付款方匹配号
    ,'000020'		tstp	  --  	交易方式
    ,if(t.tsct='@N',null,t.tsct)		tsct	  --  	涉外收支交易分类与代码
    ,t.tsdr		tsdr	  --  	资金收付标志  --  01:收 02:付
    ,t.crpp		crpp	  --  	资金用途
    ,t.crtp		crtp	  --  	交易币种
    ,t.crat		crat	  --  	交易金额与币种一致
    ,t.crat		crmb	  --  	交易金额折合人民币
    ,0		cusd	  --  	交易金额折合美元
    ,-9 ttnm-- ,d.	ttnm		ttnm	  --  	交易总数 根据客户分组计算该客户总交易的次数
    ,t.cfin		cfin	  --  	对方金融机构网点名称
    ,t.cfct		cfct	  --  	对方金融机构网点类型  --  11:现代化支付系统行号;12:人民币结算系统行号;13银行内部机构号;14:金融机构代码;99:其他
    ,t.cfic		cfic	  --  	对方金融机构网点代码
    ,null		cfrc	  --  	对方金融机构网点行政区域划分代码
    ,t.tcnm		tcnm	  --  	交易对手姓名/名称
    ,t.tcit		tcit	  --  	交易对手身份证件/证明文件类型
    ,t.tcid		tcid	  --  	交易对手身份证件/证明文件号码
    ,t.tcat		tcat	  --  	交易对手账户类型
    ,t.tcac		tcac	  --  	交易对手账号
    ,11		octt	  --  	非柜台交易方式  --  11:网上交易;12:通过POS机交易;13:通过电话交易;14:通过热键机交易;15:通过ATM机;16:通过传真交易;17:营业场所交易;99其他
    ,null		ooct	  --  	其他非柜台交易方式
    ,null		ocec	  --  	非柜台交易方式的设备代码
    ,null		rotf	  --  	交易信息备注
    ,'20190922000000' pt	--	分区字段
from ods_amltp_t_lat_data  partition(pt20190922000000)  d 
    inner join ods_amltp_t_lat_customer  partition(pt20190922000000)  c on d.r_cust_id = c.r_cust_id
    inner join ods_amltp_t_ih_tsdt  partition(pt20190922000000)  t on d.app_no = t.app_no