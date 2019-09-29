--  select concat('/* ', fielddesc, ' */', chr(10), 'select distinct ', fieldname, ' -- ', formula, chr(10), 'from ', tablename, chr(10))
--  from sys_fields
--  where fieldname != 'pt' and status = 2
--  order by tableid, fieldid

/* 金融机构编码 unpass*/
select distinct company_code2  -- 包括法人机构的编码和经营性机构编码, 金融机构内设部门可以不填写, 无编码的应向当地人民银行申领。
from rpt_fxq_tb_company_ms

/* 境内境外标识 */
select distinct bord_flag -- 境内: 10、境外: 1L
from rpt_fxq_tb_company_ms

/* 险种分类 */
select distinct ins_type -- 财产保险公司填列规则如下: 10: 车险; 11: 财产险; 12: 船货特险; 13: 责任保险; 14: 短期健康、意外保险; 15: 信用保证保险; 16: 农业保险; 17: 其他。人身保险公司填列规则如下: 20: 普通寿险; 21: 分红寿险; 22: 投资连结保险; 23: 万能保险; 24: 健康保险; 25: 意外保险; 26: 养老保险; 27: 年金保险; 28: 其他。如某一险种同时属于多类, 需同时列明, 中间用"; "隔开, 如"10; 11; 12"。填写数字。
from rpt_fxq_tb_ins_rtype_ms

/* 客户号 */
select distinct cst_no -- 填写单个客户统一客户号; 对于单客户存在多个客户号, 以及受益人或实际领款人等未开立客户号情形的, 填写"@N"。
from rpt_fxq_tb_ins_pers_ms

/* 性别 unpass*/
select distinct cst_sex  -- 11: 男; 12: 女。填写数字。
from rpt_fxq_tb_ins_pers_ms

/* 国籍（地区） unpass*/
select distinct nation -- 按照GB/T2659-2000世界各国和地区名称代码标准填写。三字符拉丁字母缩写, 如CHN、HKG。
from rpt_fxq_tb_ins_pers_ms

/* 身份证件种类 */
select distinct id_type  -- 11: 居民身份证或临时身份证; 12: 军人或武警身份证件; 13: 港澳居民来往内地通行证, 台湾居民来往大陆通行证或其他有效旅行证件; 14、港澳台居民居住证; 15: 外国公民护照; 16: 户口簿; 17: 出生证; 18: 其他类个人身份证件填写数字。
from rpt_fxq_tb_ins_pers_ms

/* 职业代码 unpass*/
select distinct occupation_code -- 填写职业代码。
from rpt_fxq_tb_ins_pers_ms

/* 客户号 */
select distinct cst_no -- 填写单个客户统一客户号; 对于单客户存在多个客户号, 以及受益人或实际领款人等未开立客户号情形的, 填写"@N"。
from rpt_fxq_tb_ins_unit_ms

/* 依法设立或经营的执照名称 */
select distinct set_file -- 21: 营业执照(含社会统一信用代码证, 多证合一); 22: 其他填写数字。
from rpt_fxq_tb_ins_unit_ms

/* 依法设立或经营的执照号码 unpass*/
select distinct license -- 对应Set_file的号码, 对于多证合一的机构填写统一社会信用代码。
from rpt_fxq_tb_ins_unit_ms

/* 法定代表人或负责人身份证件类型 unpass*/
select distinct id_type2 -- 11: 居民身份证或临时身份证; 12: 军人或武警身份证件; 13: 港澳居民来往内地通行证, 台湾居民来往大陆通行证或其他有效旅行证件; 14、港澳台居民居住证; 15: 外国公民护照; 18: 其他类个人身份证件填写数字。
from rpt_fxq_tb_ins_unit_ms

/* 控股股东或者实际控制人身份证件类型 unpass*/
select distinct id_type3 -- 11: 居民身份证或临时身份证; 12: 军人或武警身份证件; 13: 港澳居民来往内地通行证, 台湾居民来往大陆通行证或其他有效旅行证件; 14、港澳台居民居住证; 15: 外国公民护照; 18: 其他类个人身份证件21: 营业执照(含社会统一信用代码证, 多证合一); 22: 其他填写数字。
from rpt_fxq_tb_ins_unit_ms

/* 授权办理业务人员身份证件类型 unpass*/
select distinct id_type4 -- 11: 居民身份证或临时身份证; 12: 军人或武警身份证件; 13: 港澳居民往来内地身份通行证, 台湾居民来往大陆通行证或其他有效旅行证件; 14、港澳台居民居住证; 15: 外国公民护照; 18: 其他类个人身份证件填写数字。
from rpt_fxq_tb_ins_unit_ms

/* 行业代码 unpass*/
select distinct industry_code -- 填写单位客户行业代码。
from rpt_fxq_tb_ins_unit_ms

/* 注册资本金币种 unpass*/
select distinct code -- 采用国标, 如CNY、USD等; 下同。
from rpt_fxq_tb_ins_unit_ms

/* 单位客户号 */
select distinct cst_no -- 填写单个客户统一客户号; 对于单客户存在多个客户号, 以及受益人或实际领款人等未开立客户号情形的, 填写"@N"。
from rpt_fxq_tb_ins_bo_ms

/* 依法设立或经营的执照号码 unpass*/
select distinct license -- 客户身份证件号码按表4License字段要求填写。
from rpt_fxq_tb_ins_bo_ms

/* 判定受益所有人方式 unpass*/
select distinct bnf_type -- 11: 股权或表决权; 12: 人事、财务控制; 13: 高级管理人; 14其他
from rpt_fxq_tb_ins_bo_ms

/* 持股数量或表决权占比 unpass*/
select distinct shareholding_ratio -- 单位: ％。填写百分比, 保留2位小数, 如51.66, 不填写"％"符号。Bnjtype=11时填写, 不等11时填写"@N"
from rpt_fxq_tb_ins_bo_ms

/* 受益所有人证件类型 */
select distinct id_type5 -- 11: 居民身份证或临时身份证; 12: 军人或武警身份证件; 13: 港澳居民来往内地通行证, 台湾居民来往大陆通行证或其他有效旅行证件; 14、港澳台居民居住证; 15: 外国公民护照; 18: 其他类个人身份证件。填写数字。
from rpt_fxq_tb_ins_bo_ms

/* 保单状态 */
select distinct ins_state -- 11: 有效; 12: 终止; 13: 中止; 14: 其他, 以保险合同效力为判断依据。人身保险填写当前状态; 财产保险, 取数时点保单在保险期间内视为有效。填写数字。
from rpt_fxq_tb_ins_rpol_ms

/* 销售渠道 */
select distinct sale_type -- 人身保险销售渠道: 11: 个人代理; 12: 保险代理机构或经纪机构; 13: 银邮代理; 14: 网销(本机构); 15: 电销; 16: 第三方平台; 19: 其他。财产保险销售渠道: 11: 个人代理; 12: 保险代理机构或经纪机构; 13: 银邮代理; 14: 网销(本机构); 15: 电销; 16: 农村网点; 17: 营业网点; 18: 第三方平台; 19: 其他。网销(本机构)指通过本机构网站或其他方式销售, 第三方平台指通过腾讯等其他平台销售。填写数字。
from rpt_fxq_tb_ins_rpol_ms

/* 销售渠道名称 unpass*/
select distinct sale_name -- 对应Sale_type销售渠道填写。如销售渠道为"个人代理", 则本字段填写为个人代理人名称(如"张**"); 销售渠道为"银保通代理点", 则本字段填写为"**银行**分行, 等。
from rpt_fxq_tb_ins_rpol_ms

/* 投保人客户号 */
select distinct app_cst_no -- 客户唯一的标识号, 不能为空。
from rpt_fxq_tb_ins_rpol_ms

/* 投保人证件种类 unpass*/
select distinct app_id_type -- 11: 居民身份证或临时身份证; 12: 军人或武警身份证件; 13: 港澳居民来往内地通行证, 台湾居民来往大陆通行证或其他有效旅行证件; 14、港澳台居民居住证; 15: 外国公民护照; 18: 其他类个人身份证件填写数字。
from rpt_fxq_tb_ins_rpol_ms

/* 被保险人客户号*/
select distinct ins_cst_no -- 客户唯一的标识号, 不能为空。
from rpt_fxq_tb_ins_rpol_ms

/* 被保险人证件号码 unpass*/
select distinct ins_id_no -- 个人填写身份证件号码, 单位按表4License字段要求填写。
from rpt_fxq_tb_ins_rpol_ms

/* 被保险人客户类型 unpass*/
select distinct ins_cus_pro -- 11: 个人; 12: 单位客户。填写数字。
from rpt_fxq_tb_ins_rpol_ms

/* 投保人、被保险人之间的关系*/
select distinct relation -- 11: 本人; 12: 配偶; 13父母; 14子女; 15: 其他近亲属; 16; 雇佣或劳务; 17: 其他填写数字。
from rpt_fxq_tb_ins_rpol_ms

/* 受益人标识 unpass*/
select distinct legal_type -- 11: 法定受益人; 12: 指定受益人填写数字。
from rpt_fxq_tb_ins_rpol_ms

/* 受益人类型 unpass*/
select distinct benefit_cus_pro -- 11: 个人; 12: 单位客户受益人标识为法定受益人的一人或若干人时, 不填写本字段, 下同。填写数字。
from rpt_fxq_tb_ins_rpol_ms

/* 受益人名称*/
select distinct benefit_name -- 受益人标识为法定受益人的一人或若干人时, 不填写本字段, 下同。
from rpt_fxq_tb_ins_rpol_ms

/* 受益人客户号*/
select distinct benefit_cst_no -- 如未为受益人设立客户号, 填写"@N"
from rpt_fxq_tb_ins_rpol_ms

/* 受益人身份证件号码*/
select distinct benefit_id_no -- 个人填写身份证件号码, 单位按表4License字段要求填写。
from rpt_fxq_tb_ins_rpol_ms

/* 险种代码 */
select distinct ins_no -- 如: tb_ins_rtype定义; 
from rpt_fxq_tb_ins_rpol_ms

/* 币种 */
select distinct cur_code -- 按照GB/T12406-2008表示货币和资金的代码标准填写, 如CNY, USD等。
from rpt_fxq_tb_ins_rpol_ms

/* 业务种类 */
select distinct prof_type -- 11: 人身保险; 12: 财产保险填写数字。
from rpt_fxq_tb_ins_rpol_ms

/* 交费方式 */
select distinct del_way -- 11: 趸交; 12: 期缴; 13: 不定期缴填写数字。
from rpt_fxq_tb_ins_rpol_ms

/* 交费间隔 */
select distinct del_period -- 11: 年缴; 12: 季缴; 13: 月缴; 14: 其他填写数字。
from rpt_fxq_tb_ins_rpol_ms

/* 交费期数 */
select distinct `limit` -- 趸交为1; 终身交费填为9999。填写实际应交费的期数。
from rpt_fxq_tb_ins_rpol_ms

/* 保险标的物 *unpass/
select distinct subject -- 本字段适用财产保险, 填写具体的保险标的物名称, 如车牌号码; 无法明确指向保险标的统一填写替代符"@N"
from rpt_fxq_tb_ins_rpol_ms

/* 现转标识 unpass*/
select distinct tsf_flag -- 10: 现金交保险公司; 11: 转账; 12: 现金缴款单(指客户向银行缴纳现金, 凭借银行开具的单据向保险机构办理交费业务); 13: 保险公司业务员代付。网银转账、银行柜面转账、POS刷卡、直接转账给总公司账户等情形, 应标识为转账。填写数字。
from rpt_fxq_tb_ins_rpol_ms

/* 交费账户名称*/
select distinct acc_name -- Tsf_flag=11时填写, 下同。通过银行机构交费的填写银行账户名称, 通过支付机构交费的填写支付账户名称。
from rpt_fxq_tb_ins_rpol_ms

/* 保单状态 */
select distinct ins_state -- 11: 有效; 12: 终止; 13: 中止; 14: 其他, 以保险合同效力为判断依据。人身保险填写当前状态; 财产保险, 取数时点保单在保险期间内视为有效。填写数字。
from rpt_fxq_tb_ins_gpol_ms

/* 保单类型 */
select distinct app_type -- 11: 非团险; 12: 团险填写数字。
from rpt_fxq_tb_ins_gpol_ms

/* 销售渠道 */
select distinct sale_type -- 人身保险销售渠道: 11: 个人代理; 12: 保险代理机构或经纪机构; 13: 银邮代理; 14: 网销(本机构); 15: 电销; 16: 第三方平台; 19: 其他。财产保险销售渠道: 11: 个人代理; 12: 保险代理机构或经纪机构; 13: 银邮代理; 14: 网销(本机构); 15: 电销; 16: 农村网点; 17: 营业网点; 18: 第三方平台; 19: 其他。网销(本机构)指通过本机构网站或其他方式销售, 第三方平台指通过腾讯等其他平台销售。填写数字。
from rpt_fxq_tb_ins_gpol_ms

/* 销售渠道名称 unpass*/
select distinct sale_name -- 对应Sale_type销售渠道填写。如销售渠道为"个人代理", 则本字段填写为个人代理人名称(如"张**"); 销售渠道为"银保通代理点", 则本字段填写为"**银行**分行"等。
from rpt_fxq_tb_ins_gpol_ms

/* 投保人客户号 */
select distinct app_cst_no -- 客户唯一的标识号, 不能为空。
from rpt_fxq_tb_ins_gpol_ms

/* 投保人证件种类 unpass*/
select distinct app_id_type -- 21: 营业执照(含社会统一信用代码证, 多证合一); 22: 其他填写数字。
from rpt_fxq_tb_ins_gpol_ms

/* 投保人证件号码 */
select distinct app_id_no -- 单位按表4License字段要求填写。
from rpt_fxq_tb_ins_gpol_ms

/* 国有属性 unpass*/
select distinct state_owned -- 11: 国有企业; 12: 集体所有企业; 13: 联营企业; 14: 三资企业; 15: 私营企业; 16: 其他填写数字。
from rpt_fxq_tb_ins_gpol_ms

/* 险种代码 unpass*/
select distinct ins_no -- 一份团险保单涉及多个险种的, 本字段填写"多个险种"如: tb_ins_rtype定义
from rpt_fxq_tb_ins_gpol_ms

---------------------------------------------------------------
/* 币种 */
select distinct cur_code -- 按照GB/T12406-2008表示货币和资金的代码标准填写, 如CNY, USD等。
from rpt_fxq_tb_ins_gpol_ms

/* 交费方式 */
select distinct del_way -- 11: 趸交; 12: 期缴; 13: 不定期缴填写数字。
from rpt_fxq_tb_ins_gpol_ms

/* 交费间隔 */
select distinct del_period -- 11: 年缴; 12: 季缴; 13: 月缴; 14: 其他填写数字。
from rpt_fxq_tb_ins_gpol_ms

/* 交费期数 */
select distinct `limit` -- 趸交为1; 终身交费填为9999。
from rpt_fxq_tb_ins_gpol_ms

/* 保险标的物 ???为啥是地址*/
select distinct subject -- 本字段适用财产保险, 填写具体的保险标的物名称, 如车牌号码; 无法明确指向保险标的统一填写替代符"@N"
from rpt_fxq_tb_ins_gpol_ms

/* 现转标识 unpass*/
select distinct tsf_flag -- 10: 现金交保险公司; 11: 转账; 12: 现金缴款单(指客户向银行缴纳现金, 凭借银行开具的单据向保险机构办理交费业务); 13: 保险公司业务员代付。网银转账、银行柜面转账、POS刷卡、直接转账给总公司账户等情形, 应标识为转账。填写数字。
from rpt_fxq_tb_ins_gpol_ms

/* 交费账户名称 */
select distinct acc_name -- Tsf_flag=11时填写, 下同。通过银行机构交费的填写银行账户名称, 通过支付机构交费的填写支付账户名称。
from rpt_fxq_tb_ins_gpol_ms

/* 投保人客户号 */
select distinct app_cst_no -- 客户唯一的标识号, 不能为空。
from rpt_fxq_tb_ins_fav_cst_ms

/* 投保人证件号码 */
select distinct app_id_no -- 个人填写身份证件号码, 单位按表4License字段要求填写。
from rpt_fxq_tb_ins_fav_cst_ms

/* 被保险人或受益人标识 */
select distinct insfav_type -- 11: 被保险人; 12: 受益人填写数字。
from rpt_fxq_tb_ins_fav_cst_ms

/* 被保险人或受益人类型 unpass*/
select distinct insbene_cus_pro -- 11: 个人; 12: 单位客户。填写数字。
from rpt_fxq_tb_ins_fav_cst_ms

/* 投保人、被保险人之间的关系 unpass*/
select distinct relation -- 11: 本单位; 12: 本单位董事、监事或高级管理人员; 13: 雇佣或劳务; 14: 其他填写数字。
from rpt_fxq_tb_ins_fav_cst_ms

/* 受益人标识 unpass*/
select distinct fav_type -- 11: 法定受益人; 12: 非法定受益人。当被保险人或受益人标识Insfav_type='12'时填写。
from rpt_fxq_tb_ins_fav_cst_ms

/* 被保险人或受益人客户号 */
select distinct insbene_cst_no -- 如未为受益人设立客户号, 填写"@N"
from rpt_fxq_tb_ins_fav_cst_ms

/* 被保险人或受益人身份证件号码 */
select distinct insbene_id_no -- 个人填写身份证件号码, 单位按表4License字段要求填写。
from rpt_fxq_tb_ins_fav_cst_ms

/* 投保人客户号 */
select distinct app_cst_no -- 客户唯一的标识号, 不能为空。
from rpt_fxq_tb_ins_renewal_ms

/* 投保人证件种类 */
select distinct app_id_type -- 11: 居民身份证或临时身份证; 12: 军人或武警身份证件; 13: 港澳居民来往内地通行证, 台湾居民来往大陆通行证或其他有效旅行证件; 14、港澳台居民居住证; 15: 外国公民护照; 18: 其他类个人身份证件21: 营业执照(含社会统一信用代码证, 多证合一); 22: 其他填写数字。
from rpt_fxq_tb_ins_renewal_ms

/* 投保人证件号码 */
select distinct app_id_no -- 个人填写身份证件号码, 单位按表4License字段要求填写。
from rpt_fxq_tb_ins_renewal_ms

/* 险种代码 unpass关于险种代码与产品代码*/
select distinct ins_no -- 如: tb_ins_rtype定义; 
from rpt_fxq_tb_ins_renewal_ms

/* 币种 */
select distinct cur_code -- 按照GB/T12406-2008表示货币和资金的代码标准填写, 如CNY, USD等。
from rpt_fxq_tb_ins_renewal_ms

/* 现转标识 unpass*/
select distinct tsf_flag -- 10: 现金交保险公司; 11: 转账; 12: 现金缴款单(指客户向银行缴纳现金, 凭借银行开具的单据向保险机构办理交费业务); 13: 保险公司业务员代付。网银转账、银行柜面转账、POS刷卡、直接转账给总公司账户等情形, 应标识为转账。填写数字。
from rpt_fxq_tb_ins_renewal_ms

/* 交费账户名称*/
select distinct acc_name -- Tsf_flag=11时填写, 下同。通过银行机构交费的填写银行账户名称, 通过支付机构交费的填写支付账户名称。
from rpt_fxq_tb_ins_renewal_ms

/* 业务类型 unpass*/
select distinct pay_type -- 11: 退保; 12: 减保; 13: 保单部分领取; 14: 保单贷款; 15: 其他
from rpt_fxq_tb_ins_rsur_ms

/* 保费货币代码 unpass*/
select distinct cur_code -- 按照GB/T12406-2008表示货币和资金的代码标准填写, 如CNY, USD等。
from rpt_fxq_tb_ins_rsur_ms

/* 投保人客户号 */
select distinct app_cst_no -- 客户唯一的标识号, 不能为空。
from rpt_fxq_tb_ins_rsur_ms

/* 投保人证件号码 */
select distinct id_no -- 个人填写身份证件号码, 单位按表4License字段要求填写。
from rpt_fxq_tb_ins_rsur_ms

/* 投保人客户类型 unpass*/
select distinct cus_pro -- 11: 个人; 12: 单位客户。填写数字。
from rpt_fxq_tb_ins_rsur_ms

/* 业务申请人证件号码 unpass*/
select distinct sur_id_no -- 个人填写身份证件号码, 单位按表4License字段要求填写。
from rpt_fxq_tb_ins_rsur_ms

/* 币种 unpass*/
select distinct cur_code2 -- 按照GB/T12406-2008表示货币和资金的代码标准填写, 如CNY, USD等。
from rpt_fxq_tb_ins_rsur_ms

/* 支付方式 unpass*/
select distinct tsf_flag -- 10: 现金; 11: 银行转账; 12: 其他。填写数字。
from rpt_fxq_tb_ins_rsur_ms

/* 收款账户名称 */
select distinct acc_name -- Tsf_flag=11时填写, 下同。通过银行机构退费的填写银行账户名称, 通过支付机构退费的填写支付账户名称。
from rpt_fxq_tb_ins_rsur_ms

------------------- first check, and second check

---------- question uncheck
/* 投保人客户号 */
select distinct app_cst_no -- 客户唯一的标识号, 不能为空。
from rpt_fxq_tb_ins_rpay_ms

/* 投保人客户类型 */
select distinct app_cus_pro -- 11: 个人; 12: 单位客户。填写数字。
from rpt_fxq_tb_ins_rpay_ms

/* 被保险人客户号 */
select distinct ins_cst_no -- 客户唯一的标识号, 不能为空。
from rpt_fxq_tb_ins_rpay_ms

/* 被保险人证件号码 */
select distinct ins_id_no -- 个人填写身份证件号码, 单位按表4License字段要求填写。
from rpt_fxq_tb_ins_rpay_ms

/* 被保险人客户类型 */
select distinct ins_cus_pro -- 11: 个人; 12: 单位客户。填写数字。
from rpt_fxq_tb_ins_rpay_ms

/* 受益人身份证件号码 */
select distinct benefit_id_no -- 个人填写身份证件号码, 单位按表4License字段要求填写。
from rpt_fxq_tb_ins_rpay_ms

/* 受益人类型 */
select distinct benefit_pro -- 11: 个人; 12: 单位客户。填写数字。
from rpt_fxq_tb_ins_rpay_ms

/* 投保人、被保险人之间的关系 */
select distinct relation_1 -- 11: 本人; 12: 配偶; 13父母; 14子女; 15: 其他近亲属; 16; 雇佣或劳务; 17: 其他填写数字。
from rpt_fxq_tb_ins_rpay_ms

/* 给付类型 */
select distinct pay_type -- 11: 生存金给付; 12: 满期金给付; 13: 其他填写数字。
from rpt_fxq_tb_ins_rpay_ms

/* 币种 */
select distinct cur_code2 -- 按照GB/T12406-2008表示货币和资金的代码标准填写, 如CNY, USD等。
from rpt_fxq_tb_ins_rpay_ms

/* 给付支付方式 */
select distinct tsf_flag -- 10: 现金; 11: 银行转账; 12: 其他。填写数字。
from rpt_fxq_tb_ins_rpay_ms

/* 收款账户名称 */
select distinct acc_name -- Tsf_flag=11时填写, 下同。通过银行机构给付的填写银行账户名称, 通过支付机构给付的填写支付账户名称。
from rpt_fxq_tb_ins_rpay_ms

/* 投保人客户号 */
select distinct app_cst_no -- 客户唯一的标识号, 不能为空。
from rpt_fxq_tb_ins_rcla_ms

/* 投保人客户类型 */
select distinct app_cus_pro -- 11: 个人; 12: 单位客户。填写数字。
from rpt_fxq_tb_ins_rcla_ms

/* 被保险人客户号 */
select distinct ins_cst_no -- 客户唯一的标识号, 不能为空。
from rpt_fxq_tb_ins_rcla_ms

/* 被保险人证件号码 */
select distinct ins_id_no -- 个人填写身份证件号码, 单位按表4License字段要求填写。
from rpt_fxq_tb_ins_rcla_ms

/* 被保险人客户类型 */
select distinct ins_cus_pro -- 11: 个人; 12: 单位客户。填写数字。
from rpt_fxq_tb_ins_rcla_ms

/* 受益人身份证件号码 */
select distinct benefit_id_no -- 个人填写身份证件号码, 单位按表4License字段要求填写。
from rpt_fxq_tb_ins_rcla_ms

/* 受益人类型 */
select distinct benefit_type -- 11: 个人; 12: 单位客户。填写数字。
from rpt_fxq_tb_ins_rcla_ms

/* 投保人、被保险人之间的关系 */
select distinct relation_1 -- 11: 本人; 12: 直系亲属; 13: 近亲属; 14; 雇佣或劳务; 15: 业务关系; 16: 其他填写数字。
from rpt_fxq_tb_ins_rcla_ms

/* 理赔申请人身份证件类型 */
select distinct cla_id_type -- 11: 居民身份证或临时身份证; 12: 军人或武警身份证件; 13: 港澳居民来往内地通行证, 台湾居民来往大陆通行证或其他有效旅行证件; 14、港澳台居民居住证; 15: 外国公民护照; 16: 户口簿; 17: 出生证; 18: 其他类个人身份证件21: 营业执照(含社会统一信用代码证, 多证合一); 22: 其他填写数字。
from rpt_fxq_tb_ins_rcla_ms

/* 理赔申请人类型 */
select distinct cla_pro -- 11: 被保险人; 12: 受益人; 13: 其他填写数字。
from rpt_fxq_tb_ins_rcla_ms

/* 币种 */
select distinct cur_code -- 按照GB/T12406-2008表示货币和资金的代码标准填写, 如CNY, USD等。
from rpt_fxq_tb_ins_rcla_ms

/* 支付方式 */
select distinct tsf_flag -- 10: 现金; 11: 银行转账; 12: 其他。填写数字。
from rpt_fxq_tb_ins_rcla_ms

/* 实际领款人类型 */
select distinct acc_type -- 11: 个人; 12: 单位客户。填写数字。
from rpt_fxq_tb_ins_rcla_ms

/* 实际领款人身份证件类型 */
select distinct acc_id_type -- 11: 居民身份证或临时身份证; 12: 军人或武警身份证件; 13: 港澳居民来往内地通行证, 台湾居民来往大陆通行证或其他有效旅行证件; 14、港澳台居民居住证; 15: 外国公民护照; 16: 户口簿; 17: 出生证; 18: 其他类个人身份证件21: 营业执照(含社会统一信用代码证, 多证合一); 22: 其他。填写数字。
from rpt_fxq_tb_ins_rcla_ms

/* 保全/批改项目 */
select distinct item -- 11: 变更投保人; 12: 团险替换被保险人; 13: 变更受益人; 14: 变更客户(投保人、被保险人)信息如姓名、证件号、注册资本、经营范围、联系方式、地址、法定代表人等; 15: 保单转移(变更管理机构)。其他类型的保全/批改业务可不提供。填写数字。
from rpt_fxq_tb_ins_rchg_ms

/***********************down list check in second time***********************************/
/* 风险等级 */
select distinct risk_code -- 如采取三级分类, 10: 高; 11: 中; 12: 低。如采取五级分类, 10: 高; 11: 中高; 12: 中; 13: 中低; 14: 低。以此类推, 按等级从高到低依次升序填写。填写数字等级。
from rpt_fxq_tb_ins_risk_new_ms

/* 划分依据 */
select distinct norm -- 填写具体划分标准及相应得分分值, 多个标准间用"; "隔开。如, 保单险种2分; 保险期间3分等, 如采用直接评级的, 填写评级理由, 如"涉及保险欺诈"等。
from rpt_fxq_tb_ins_risk_new_ms

/* 风险等级 */
select distinct risk_code -- 如采取三级分类, 10: 高; 11: 中; 12: 低。如采取五级分类, 10: 高; 11: 中高; 12: 中; 13: 中低; 14: 低。以此类推, 按等级从高到低依次升序填写。填写数字等级。
from rpt_fxq_tb_ins_risk_ms

/* 首次标识 */
select distinct first_type -- 11是, 12否。
from rpt_fxq_tb_ins_risk_ms

/* 划分依据 unpass*/
select distinct norm -- 填写具体划分标准及相应得分分值, 多个标准间用"; "隔开。如, 保单险种2分; 保险期间3分等, 如采用直接评级的, 填写评级理由, 如"涉及保险欺诈"等。
from rpt_fxq_tb_ins_risk_ms

/* 报告机构编码 */
select distinct ricd -- 人民银行发放的《金融机构代码证》上载明的金融机构代码, 如果尚未取得金融机构代码, 则经申请后由中国反洗钱监测分析中心分配报告机构编码
from rpt_fxq_tb_lar_report_ms

/* 金融机构网点代码 */
select distinct finc -- 有金融机构代码的网点应使用金融机构代码, 暂时没有该代码的网点可自行编制内部唯一代码。报告机构向反洗钱中心报送交易报告前, 应在系统中报备其内部网点代码对照表, 并在发生变化后及时更新。
from rpt_fxq_tb_lar_report_ms

/* 大额交易客户总数 unpass*/
select distinct cttn -- 大额交易客户总数>=大额交易客户序号
from rpt_fxq_tb_lar_report_ms

/* 金融机构与客户的关系 unpass*/
select distinct rlfc -- 00: 客户通过在境内金融机构开立的账户或者银行卡所发生的交易, "金融机构"为开立账户的机构或发卡银行; 01: 客户通过境外银行卡所发生的交易, "金融机构"为收单行; 02: 客户不通过账户或者银行卡发生的交易, "金融机构"为办理业务的机构
from rpt_fxq_tb_lar_report_ms

/* 客户身份证件/证明文件类型 */
select distinct citp -- 按照10.1节身份证件/证明文件代码表填写。
from rpt_fxq_tb_lar_report_ms

/* 其他身份证件/证明文件类型 */
select distinct oitp -- 如下列字段填写了119999、129999、619999或629999, 本字段须填写具体的身份证件/证明文件类型, 否则填写替代符"@N": 1.客户身份证件/证明文件类型(CITP); 2.交易代办人身份证件/证明文件类型(TBIT); 3.交易对手身份证件/证明文件类型(TCIT)
from rpt_fxq_tb_lar_report_ms

/* 客户身份证件/证明文件号码 */
select distinct ctid -- 1.居民身份证号长度应为15位或者18位; 2.组织机构代码长度应为9位(如为10位则去掉最后一位校验码前的连接符"-")。
from rpt_fxq_tb_lar_report_ms

/* 客户账户类型 unpass*/
select distinct catp -- 按照10.2节账户类型代码表填写
from rpt_fxq_tb_lar_report_ms

/* 客户银行卡类型 unpass*/
select distinct cbct -- 10: 借记卡; 20: 贷记卡; 30: 准贷记卡; 90: 其他
from rpt_fxq_tb_lar_report_ms

/* 客户银行卡其他类型 unpass*/
select distinct ocbt -- 如果字段"客户银行卡类型(CBCT)"选择为"90", 此项须填写具体的银行卡类型, 否则填写"@N"
from rpt_fxq_tb_lar_report_ms

/* 客户职业(对私) 或客户行业(对公) unpass*/
select distinct ctvc -- 1.客户职业按照GB/T6565-2015职业分类与代码填写, 可根据实际情况填写可疑主体职业的"大类"、"中类"或"小类"; 2.客户行业按照GB/T4754-2011国民经济行业分类与代码标准填写, 可根据实际情况填写可疑主体行业的"门类"、"大类"、"中类"或"小类"; 3.对于客户处于失业、无业或离退休等情况, 填写"99999"
from rpt_fxq_tb_lar_report_ms

/* 客户联系电话 unpass*/
select distinct cctl -- 1.电话号码应按照如下两种方式之一填写: 手机: 手机号码; 固定电话: 区号+"-"+固定电话; 2.如果报告机构掌握客户的多个联系电话, 则应设置多个"客户联系电话"字段, 每个字段填写一个联系电话
from rpt_fxq_tb_lar_report_ms

/* 客户国籍 */
select distinct ctnt -- 1.按照GB/T2659-2000世界各国和地区名称代码标准填写; 2.如报告机构掌握客户的多个国籍, 则需设置多个"客户国籍"字段, 每个字段填写一个国别或地区代码
from rpt_fxq_tb_lar_report_ms

/* 大额交易特征代码 */
select distinct crcd -- 0501: 当日单笔或者累计交易人民币5万元以上(含5万元)、外币等值1万美元以上(含1万美元)的现金缴存、现金支取、现金结售汇、现钞兑换、现金汇款、现金票据解付及其他形式的现金收支; 0502: 非自然人客户银行账户与其他的银行账户之间当日单笔或者累计交易人民币200万元以上(含200万元)、外币等值20万美元以上(含20万美元)的款项划转; 0503: 自然人客户银行账户与其他的银行账户之间当日单笔或者累计人民币50万元以上(含50万元)、外币等值10万美元以上(含10万美元)的境内款项划转; 0504: 自然人客户银行账户与其他的银行账户之间当日单笔或者累计人民币20万元以上(含20万元)、外币等值1万美元以上(含1万美元)的跨境款项划转
from rpt_fxq_tb_lar_report_ms

/* 交易代办人身份证件/证明文件类型 unpass*/
select distinct tbit -- 按照10.1节身份证件/证明文件代码表填写。
from rpt_fxq_tb_lar_report_ms

/* 交易代办人身份证件/证明文件号码 unpass*/
select distinct tbid -- 居民身份证号长度应为15位或者18位。
from rpt_fxq_tb_lar_report_ms

/* 交易代办人国籍 unpass*/
select distinct tbnt -- 按照GB/T2659-2000世界各国和地区名称代码标准填写。
from rpt_fxq_tb_lar_report_ms

/* 交易发生地 */
select distinct trcd -- 1.当交易发生地为中国大陆地区时, 前3位填写CHN或特殊经济区类型代码, 后6位按照大陆地区行政区划代码填写区、县级粒度的代码; 2.当交易发生地为中国大陆地区以外的国家或地区时, 前3位填写国别代码, 后6位填写000000; 3.行政区划代码以国家统计局公布的最新县及县以上行政区划代码为准; 4.国别代码使用GB/T2659-2000世界各国和地区名称代码中的3位字符代码; 5.特殊经济区类型代码按照10.4节特殊经济区类型代码表填写
from rpt_fxq_tb_lar_report_ms

/* 收付款方匹配号类型 unpass*/
select distinct rpmt -- 按照10.5节收付款方匹配号类型代码表填写
from rpt_fxq_tb_lar_report_ms

/* 收付款方匹配号 unpass*/
select distinct rpmn -- 按照10.5节收付款方匹配号类型代码表的规定填写
from rpt_fxq_tb_lar_report_ms

/* 交易方式 */
select distinct tstp -- 按照10.3节交易方式代码表填写
from rpt_fxq_tb_lar_report_ms

/* 涉外收支交易分类与代码 unpass*/
select distinct tsct -- 按照GB/T19583-2014涉外收支交易分类与代码标准填写。
from rpt_fxq_tb_lar_report_ms

/* 资金收付标志 unpass*/
select distinct tsdr -- 01: 收; 02: 付
from rpt_fxq_tb_lar_report_ms

/* 交易币种 unpass*/
select distinct crtp -- 按照GB/T12406-2008表示货币和资金的代码标准填写。
from rpt_fxq_tb_lar_report_ms

/* 对方金融机构网点代码类型 unpass*/
select distinct cfct -- 11: 现代化支付系统行号; 12: 人民币结算账户管理系统行号; 13: 银行内部机构号; 14: 金融机构代码; 99: 其他
from rpt_fxq_tb_lar_report_ms

/* 对方金融机构网点行政区划代码 unpass*/
select distinct cfrc -- 1.当网点在中国大陆地区时, 前3位填写CHN或特殊经济区类型代码, 后6位按照大陆地区行政区划代码填写区、县级的代码; 2.当网点中国大陆地区以外的国家或地区时, 前3位填写国别代码, 后6位填写000000; 3.行政区划代码以国家统计局公布的最新县及县以上行政区划代码为准; 4.国别代码使用GB/T2659-2000世界各国和地区名称代码中的3位字符代码; 5.特殊经济区类型代码按照10.4节特殊经济区类型代码表填写
from rpt_fxq_tb_lar_report_ms

/* 交易对手身份证件/证明文件类型 unpass*/
select distinct tcit -- 按照10.1节身份证件/证明文件代码表填写。
from rpt_fxq_tb_lar_report_ms

/* 交易对手身份证件/证明文件号码 unpass*/
select distinct tcid -- 1.居民身份证号长度应为15位或者18位; 2.组织机构代码长度应为9位(如为10位则去掉最后一位校验码前的连接符"-")。
from rpt_fxq_tb_lar_report_ms

/* 交易对手账户类型 unpass*/
select distinct tcat -- 按照10.2节账户类型代码表填写
from rpt_fxq_tb_lar_report_ms

/* 非柜台交易方式 */
select distinct octt -- 11: 网上交易; 12: 通过POS机交易; 13: 通过电话交易; 14: 通过热键机交易; 15: 通过ATM; 16: 通过传真交易; 17: 营业场所交易(仅针对证券期货业); 99: 其他(若选择此项, 报告机构应在字段"其他非柜台交易方式(OOCT)"对其类型做进一步说明)
from rpt_fxq_tb_lar_report_ms

/* 其他非柜台交易方式 unpass*/
select distinct ooct -- 如字段"非柜台交易方式(OCTT)"选择为"99", 本字段须填写非柜台交易方式的具体类型, 否则填写替代符"@N"
from rpt_fxq_tb_lar_report_ms

/* 非柜台交易方式的设备代码 unpass*/
select distinct ocec -- 1.对于网上交易, 填写IP地址和MAC地址, 之间使用"@"分隔, 如果客户使用手机登录网络进行交易, 可填写手机号码和设备信息(IMEI、UDID等), 中间使用分割; 2.对于POS交易, 填写POS机编号; 3.对于电话交易, 填写电话号码; 4.对于热键机交易, 填写MAC地址; 5.对于ATM交易, 填写ATM编号; 6.对于传真交易, 填写传真号码; 7.对于营业场所交易, 填写营业场所网点代码地址(仅针对证券期货业); 8.对于其他未列出的非柜台交易方式, 填写其对应的设备代码
from rpt_fxq_tb_lar_report_ms

/* 交易信息备注 */
select distinct rotf -- 暂填写"@N"
from rpt_fxq_tb_lar_report_ms

/* 报告机构编码 */
select distinct ricd -- 人民银行发放的《金融机构代码证》上载明的金融机构代码, 如果尚未取得金融机构代码, 则经申请后由中国反洗钱监测分析中心分配报告机构编码。
from rpt_fxq_tb_sus_report_ms

/* 金融机构网点代码 */
select distinct finc  -- 有金融机构代码的网点应使用金融机构代码, 暂时没有该代码的网点可自行编制内部唯一代码。报告机构向反洗钱中心报送交易报告前, 应在系统中报备其内部网点代码对照表, 并在发生变化后及时更新。
from rpt_fxq_tb_sus_report_ms

/* 可疑主体身份证件或证明文件类型 */
select distinct setp  -- 按照10.1节身份证件/证明文件代码表填写。
from rpt_fxq_tb_sus_report_ms

/* 可疑主体证件号码 */
select distinct seid  -- 1.居民身份证号长度应为15位或者18位; 2.组织机构代码长度应为9位(如为10位则去掉最后一位校验码前的连接符"-")。
from rpt_fxq_tb_sus_report_ms

/* 可疑主体职业(对私)或行业(对公) unpass*/
select distinct sevc -- 1.可疑主体职业按照GB/T6565-2015职业分类与代码填写, 可根据实际情况填写可疑主体职业的"大类"、"中类"或"小类"; 2.可疑主体行业按照GB/T4754-2011国民经济行业分类与代码标准填写, 可根据实际情况填写可疑主体行业的"门类"、"大类"、"中类"或"小类"; 3.对于可疑主体处于失业、无业或离退休等情况, 填写"99999"
from rpt_fxq_tb_sus_report_ms

/* 可疑主体法定代表人身份证件类型 unpass*/
select distinct srit  -- 按照10.1节身份证件/证明文件代码表填写。
from rpt_fxq_tb_sus_report_ms

/* 可疑主体法定代表人身份证件号码 unpass*/
select distinct srid -- 居民身份证号长度应为15位或者18位。
from rpt_fxq_tb_sus_report_ms

/* 可疑主体控股股东或实际控制人身份证件或证明文件类型 unpass*/
select distinct scit -- 按照10.1节身份证件/证明文件代码表填写。
from rpt_fxq_tb_sus_report_ms

/* 可疑主体控股股东或实际控制人身份证件或证明文件号码 unpass*/
select distinct scid -- 1.居民身份证号长度应为15位或者18位; 2.组织机构代码长度应为9位(如为10位则去掉最后一位校验码前的连接符"-")。
from rpt_fxq_tb_sus_report_ms

/* 可疑主体国籍 */
select distinct stnt -- 1.按照GB/T2659-2000世界各国和地区名称代码标准填写; 2.如报告机构掌握可疑主体的多个国籍, 则需设置多个"可疑主体国籍"字段, 每个字段填写一个国别或地区代码。
from rpt_fxq_tb_sus_report_ms

/* 报告紧急程度 */
select distinct detr -- 01: 非特别紧急; 02: 特别紧急。
from rpt_fxq_tb_sus_report_ms

/* 报送次数标志 */
select distinct torp -- 初次报送填写1, 然后逐次累加, 最大填写9999, 如果超过9999则该部分填写0000。
from rpt_fxq_tb_sus_report_ms

/* 报送方向 */
select distinct dorp -- 01: 报告中国反洗钱监测分析中心; 02: 报告中国反洗钱监测分析中心和人民银行当地分支机构; 03: 报告中国反洗钱监测分析中心和当地公安机关; 04: 报告中国反洗钱监测分析中心、人民银行当地分支机构和当地公安机关; 99: 报告中国反洗钱监测分析中心和其他机构(若选择此项, 报告机构应在字段"其他报送方向(ODRP)"对"其他机构"做进一步说明)。
from rpt_fxq_tb_sus_report_ms

/* 可疑交易报告触发点 */
select distinct tptr -- 01: 模型筛选; 02: 执法部门指令(公安、纪检、安全等部门的境内冻结、协查等); 03: 监管部门指令(如央行、证监会、交易所等部门的警示或协查等); 04: 金融机构内部案件(机构内部违规违法行为等); 05: 社会舆情; 06: 金融机构从业人员发现的身份、行为等异常状况; 99: 其他(若选择此项, 报告机构应在字段"其他可疑交易报告触发点(OTPR)"对其触发点做进一步说明)
from rpt_fxq_tb_sus_report_ms

/* 疑似涉罪类型 */
select distinct tosc -- 1.按照10.6节疑似涉罪类型代码表填写。2.如果可疑交易行为涉嫌多个疑似涉罪类型, 则应设置多个"疑似涉罪类型"字段, 每个字段填写一个疑似涉罪类型代码。
from rpt_fxq_tb_sus_report_ms

/* 保险种类 */
select distinct istp -- 01: 人寿险; 02: 财产险; 03: 再保险; 99: 其他。
from rpt_fxq_tb_sus_report_ms

/* 保险期间 unpass*/
select distinct isps -- 以起始日期+终止日期的形式报送, 格式为"年年年年月月曰日年年年年月月日日"
from rpt_fxq_tb_sus_report_ms

/* 投保人身份证件或证明文件类型 */
select distinct aitp -- 按照10.1节身份证件/证明文件代码表填写。
from rpt_fxq_tb_sus_report_ms

/* 投保人身份证件或证明文件号码 */
select distinct alid -- 1.居民身份证号长度应为15位或者18位; 2.组织机构代码长度应为9位(如为10位则去掉最后一位校验码前的连接符"-")。
from rpt_fxq_tb_sus_report_ms

/* 投保人类型 */
select distinct altp -- 01: 机关; 02: 团体; 03: 企业; 04: 事业单位; 05: 其他组织; 06: 个体工商户; 07: 自然人。
from rpt_fxq_tb_sus_report_ms

/* 被保险人身份证件或证明文件类型 */
select distinct iitp -- 按照10.1节身份证件/证明文件代码表填写。
from rpt_fxq_tb_sus_report_ms

/* 被保险人身份证件或证明文件号码 */
select distinct isid -- 1.居民身份证号长度应为15位或者18位; 2.组织机构代码长度应为9位(如为10位则去掉最后一位校验码前的连接符"-")。
from rpt_fxq_tb_sus_report_ms

/* 受益人身份证件或证明文件类型 unpass*/
select distinct bitp -- 按照10.1节身份证件/证明文件代码表填写。
from rpt_fxq_tb_sus_report_ms

/* 受益人身份证件或证明文件号码 unpass*/
select distinct bnid -- 1.居民身份证号长度应为15位或者18位; 2.组织机构代码长度应为9位(如为10位则去掉最后一位校验码前的连接符"-")。
from rpt_fxq_tb_sus_report_ms

/* 交费方式 */
select distinct ispt -- 01: 期缴; 02: 趸缴; 99: 其他。
from rpt_fxq_tb_sus_report_ms

/* 交易发生地 */
select distinct trcd -- 1.当交易发生地为中国大陆地区时, 前3位填写CHN或特殊经济区类型代码, 后6位按照大陆地区行政区划代码填写区、县级粒度的代码; 2.当交易发生地为中国大陆地区以外的国家或地区时, 前3位填写国别代码, 后6位填写000000; 3.行政区划代码以国家统计局公布的最新县及县以上行政区划代码为准; 4.国别代码使用GB/T2659-2000世界各国和地区名称代码中的3位字符代码。
from rpt_fxq_tb_sus_report_ms

/* 交易类型 */
select distinct ittp -- 01: 投保; 02: 领取; 03: 退保; 99: 其他保全项目。
from rpt_fxq_tb_sus_report_ms

/* 币种 */
select distinct crtp -- 按照GB/T12406-2008表示货币和资金的代码标准填写。
from rpt_fxq_tb_sus_report_ms

/* 资金进出方向 */
select distinct crdr -- 01: 收, 资金账户转入资金(卖出交易产品); 02: 付, 资金账户转出资金(买入交易产品)
from rpt_fxq_tb_sus_report_ms

/* 资金进出方式 */
select distinct cstp -- 01: 现金; 02: 转账; 99: 其他。
from rpt_fxq_tb_sus_report_ms

/* 受益人总人数 */
select distinct bntn -- 同一被保险人的受益人总数。
from rpt_fxq_tb_sus_report_ms

/* 人工补正标识 unpass?*/
select distinct mirs -- 1.对于应答人工补正通知的报文, 填写中国反洗钱监测分析中心下发的人工补正通知文件名; 2.对于其他用途的报文, 填写替代符"@N"
from rpt_fxq_tb_sus_report_ms

/* 其他可疑交易报告触发点 unpass?*/
select distinct otpr -- 如字段"可疑交易报告触发点(TPTR)"选择为"99", 本字段须填写可疑交易报告的具体触发点, 否则填写替代符"@N"
from rpt_fxq_tb_sus_report_ms

/* 可疑主体控股股东其他身份证件/证明文件类型 unpass*/
select distinct ocit -- 如字段"可疑主体控股股东或实际控制人身份证件/证明文件类型(SCIT)"填写了119999、129999、619999或629999, 本字段须填写具体的身份证件/证明文件类型, 否则填写替代符"@N"
from rpt_fxq_tb_sus_report_ms

/* 其他报送方向 unpass*/
select distinct odrp -- 如字段"报送方向(DORP)"选择为"99", 本字段须填写可疑交易报告的具体报送方向, 否则填写替代符"@N"
from rpt_fxq_tb_sus_report_ms

/* 其他身份证件/证明文件类型 unpass*/
select distinct oitp -- 如下列字段填写了119999、129999、619999或629999, 本字段须填写具体的身份证件/证明文件类型, 否则填写替代符"@N": 1.客户身份证件/证明文件类型(CITP); 2.交易代办人身份证件/证明文件类型(TBIT); 3.交易对手身份证件/证明文件类型(TCIT); 4.可疑主体身份证件/证明文件类型(SETP); 5.投保人身份证件/证明文件类型(AITP); 6.被保险人身份证件/证明文件类型(IITP); 7.受益人身份证件/证明文件类型(BITP)。
from rpt_fxq_tb_sus_report_ms

/* 可疑主体法定代表人其他身份证件/证明文件类型 unpass*/
select distinct orit -- 如字段"可疑主体法定代表人身份证件类型(SRIT)"填写了119999、129999、619999或629999, 本字段须填写具体的身份证件/证明文件类型, 否则填写替代符"@N"。
from rpt_fxq_tb_sus_report_ms

/* 初次报送的可疑交易报告报文名称 unpass*/
select distinct orxn -- 即银发[2017]99号文中所指的"首次提交可疑交易报告号"。当字段"报送次数标志(TORP)"填写内容不为1时, 需要同时提供与该份报告相关联, 且"报送次数标志"为1的已正确入库的可疑交易报告报文名称(不加扩展名), 否则填写替代符"@N"。
from rpt_fxq_tb_sus_report_ms

/* 可疑主体联系电话 */
select distinct sctl -- 1.电话号码应按照如下两种方式之一填写: 手机: 11位手机号码; 固定电话: 区号++固定电话; 2.如果报告机构掌握可疑主体的多个联系电话, 则应设置多个"可疑主体联系电话"字段, 每个字段填写一个联系电话。
from rpt_fxq_tb_sus_report_ms