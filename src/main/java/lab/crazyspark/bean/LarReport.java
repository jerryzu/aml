package lab.crazyspark.bean;

import java.sql.SQLException;
import org.apache.commons.dbutils.QueryRunner;
import lab.crazyspark.annotation.Entity;

@Entity(table = "tb_lar_report")
public class LarReport {
    private String ricd;
    private String finc;
    private String sbdt;
    private String cttn;
    private String code;
    private String rlfc;
    private String ctnm;
    private String citp;
    private String oitp;
    private String ctid;
    private String csnm;
    private String catp;
    private String ctac;
    private String cbct;
    private String ocbt;
    private String cbcn;
    private String ctvc;
    private String cctl;
    private String ccei;
    private String ctar;
    private String ctnt;
    private String oatm;
    private String crcd;
    private String tbnm;
    private String tbit;
    private String tbid;
    private String tbnt;
    private String tstm;
    private String trcd;
    private String ticd;
    private String rpmt;
    private String rpmn;
    private String tstp;
    private String tsct;
    private String tsdr;
    private String crpp;
    private String crtp;
    private double crat;
    private String crmb;
    private double cusd;
    private String ttnm;
    private String cfin;
    private String cfct;
    private String cfic;
    private String cfrc;
    private String tcnm;
    private String tcit;
    private String tcid;
    private String tcat;
    private String tcac;
    private String octt;
    private String ooct;
    private String ocec;
    private String rotf;

    public void print() {
        System.out.println(String.format(
                "LarReport:  ricd%s  finc%s  sbdt%s  cttn%s  code%s  rlfc%s  ctnm%s  citp%s  oitp%s  ctid%s  csnm%s  catp%s  ctac%s  cbct%s  ocbt%s  cbcn%s  ctvc%s  cctl%s  ccei%s  ctar%s  ctnt%s  oatm%s  crcd%s  tbnm%s  tbit%s  tbid%s  tbnt%s  tstm%s  trcd%s  ticd%s  rpmt%s  rpmn%s  tstp%s  tsct%s  tsdr%s  crpp%s  crtp%s  crat%s  crmb%s  cusd%s  ttnm%s  cfin%s  cfct%s  cfic%s  cfrc%s  tcnm%s  tcit%s  tcid%s  tcat%s  tcac%s  octt%s  ooct%s  ocec%s  rotf%s",
                ricd, finc, sbdt, cttn, code, rlfc, ctnm, citp, oitp, ctid, csnm, catp, ctac, cbct, ocbt, cbcn, ctvc,
                cctl, ccei, ctar, ctnt, oatm, crcd, tbnm, tbit, tbid, tbnt, tstm, trcd, ticd, rpmt, rpmn, tstp, tsct,
                tsdr, crpp, crtp, crat, crmb, cusd, ttnm, cfin, cfct, cfic, cfrc, tcnm, tcit, tcid, tcat, tcac, octt,
                ooct, ocec, rotf));
    }

    public String getRicd() {
        return ricd;
    }

    public void setRicd(String ricd) {
        this.ricd = ricd;
    }

    public String getFinc() {
        return finc;
    }

    public void setFinc(String finc) {
        this.finc = finc;
    }

    public String getSbdt() {
        return sbdt;
    }

    public void setSbdt(String sbdt) {
        this.sbdt = sbdt;
    }

    public String getCttn() {
        return cttn;
    }

    public void setCttn(String cttn) {
        this.cttn = cttn;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getRlfc() {
        return rlfc;
    }

    public void setRlfc(String rlfc) {
        this.rlfc = rlfc;
    }

    public String getCtnm() {
        return ctnm;
    }

    public void setCtnm(String ctnm) {
        this.ctnm = ctnm;
    }

    public String getCitp() {
        return citp;
    }

    public void setCitp(String citp) {
        this.citp = citp;
    }

    public String getOitp() {
        return oitp;
    }

    public void setOitp(String oitp) {
        this.oitp = oitp;
    }

    public String getCtid() {
        return ctid;
    }

    public void setCtid(String ctid) {
        this.ctid = ctid;
    }

    public String getCsnm() {
        return csnm;
    }

    public void setCsnm(String csnm) {
        this.csnm = csnm;
    }

    public String getCatp() {
        return catp;
    }

    public void setCatp(String catp) {
        this.catp = catp;
    }

    public String getCtac() {
        return ctac;
    }

    public void setCtac(String ctac) {
        this.ctac = ctac;
    }

    public String getCbct() {
        return cbct;
    }

    public void setCbct(String cbct) {
        this.cbct = cbct;
    }

    public String getOcbt() {
        return ocbt;
    }

    public void setOcbt(String ocbt) {
        this.ocbt = ocbt;
    }

    public String getCbcn() {
        return cbcn;
    }

    public void setCbcn(String cbcn) {
        this.cbcn = cbcn;
    }

    public String getCtvc() {
        return ctvc;
    }

    public void setCtvc(String ctvc) {
        this.ctvc = ctvc;
    }

    public String getCctl() {
        return cctl;
    }

    public void setCctl(String cctl) {
        this.cctl = cctl;
    }

    public String getCcei() {
        return ccei;
    }

    public void setCcei(String ccei) {
        this.ccei = ccei;
    }

    public String getCtar() {
        return ctar;
    }

    public void setCtar(String ctar) {
        this.ctar = ctar;
    }

    public String getCtnt() {
        return ctnt;
    }

    public void setCtnt(String ctnt) {
        this.ctnt = ctnt;
    }

    public String getOatm() {
        return oatm;
    }

    public void setOatm(String oatm) {
        this.oatm = oatm;
    }

    public String getCrcd() {
        return crcd;
    }

    public void setCrcd(String crcd) {
        this.crcd = crcd;
    }

    public String getTbnm() {
        return tbnm;
    }

    public void setTbnm(String tbnm) {
        this.tbnm = tbnm;
    }

    public String getTbit() {
        return tbit;
    }

    public void setTbit(String tbit) {
        this.tbit = tbit;
    }

    public String getTbid() {
        return tbid;
    }

    public void setTbid(String tbid) {
        this.tbid = tbid;
    }

    public String getTbnt() {
        return tbnt;
    }

    public void setTbnt(String tbnt) {
        this.tbnt = tbnt;
    }

    public String getTstm() {
        return tstm;
    }

    public void setTstm(String tstm) {
        this.tstm = tstm;
    }

    public String getTrcd() {
        return trcd;
    }

    public void setTrcd(String trcd) {
        this.trcd = trcd;
    }

    public String getTicd() {
        return ticd;
    }

    public void setTicd(String ticd) {
        this.ticd = ticd;
    }

    public String getRpmt() {
        return rpmt;
    }

    public void setRpmt(String rpmt) {
        this.rpmt = rpmt;
    }

    public String getRpmn() {
        return rpmn;
    }

    public void setRpmn(String rpmn) {
        this.rpmn = rpmn;
    }

    public String getTstp() {
        return tstp;
    }

    public void setTstp(String tstp) {
        this.tstp = tstp;
    }

    public String getTsct() {
        return tsct;
    }

    public void setTsct(String tsct) {
        this.tsct = tsct;
    }

    public String getTsdr() {
        return tsdr;
    }

    public void setTsdr(String tsdr) {
        this.tsdr = tsdr;
    }

    public String getCrpp() {
        return crpp;
    }

    public void setCrpp(String crpp) {
        this.crpp = crpp;
    }

    public String getCrtp() {
        return crtp;
    }

    public void setCrtp(String crtp) {
        this.crtp = crtp;
    }

    public double getCrat() {
        return crat;
    }

    public void setCrat(double crat) {
        this.crat = crat;
    }

    public String getCrmb() {
        return crmb;
    }

    public void setCrmb(String crmb) {
        this.crmb = crmb;
    }

    public double getCusd() {
        return cusd;
    }

    public void setCusd(double cusd) {
        this.cusd = cusd;
    }

    public String getTtnm() {
        return ttnm;
    }

    public void setTtnm(String ttnm) {
        this.ttnm = ttnm;
    }

    public String getCfin() {
        return cfin;
    }

    public void setCfin(String cfin) {
        this.cfin = cfin;
    }

    public String getCfct() {
        return cfct;
    }

    public void setCfct(String cfct) {
        this.cfct = cfct;
    }

    public String getCfic() {
        return cfic;
    }

    public void setCfic(String cfic) {
        this.cfic = cfic;
    }

    public String getCfrc() {
        return cfrc;
    }

    public void setCfrc(String cfrc) {
        this.cfrc = cfrc;
    }

    public String getTcnm() {
        return tcnm;
    }

    public void setTcnm(String tcnm) {
        this.tcnm = tcnm;
    }

    public String getTcit() {
        return tcit;
    }

    public void setTcit(String tcit) {
        this.tcit = tcit;
    }

    public String getTcid() {
        return tcid;
    }

    public void setTcid(String tcid) {
        this.tcid = tcid;
    }

    public String getTcat() {
        return tcat;
    }

    public void setTcat(String tcat) {
        this.tcat = tcat;
    }

    public String getTcac() {
        return tcac;
    }

    public void setTcac(String tcac) {
        this.tcac = tcac;
    }

    public String getOctt() {
        return octt;
    }

    public void setOctt(String octt) {
        this.octt = octt;
    }

    public String getOoct() {
        return ooct;
    }

    public void setOoct(String ooct) {
        this.ooct = ooct;
    }

    public String getOcec() {
        return ocec;
    }

    public void setOcec(String ocec) {
        this.ocec = ocec;
    }

    public String getRotf() {
        return rotf;
    }

    public void setRotf(String rotf) {
        this.rotf = rotf;
    }
}
