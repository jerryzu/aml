package lab.crazyspark.bean;

import java.sql.SQLException;
import org.apache.commons.dbutils.QueryRunner;
import lab.crazyspark.annotation.Entity;

@Entity(table = "tb_sus_report")
public class SusReport {
    private String ricd;
    private String finc;
    private String senm;
    private String setp;
    private String seid;
    private String sevc;
    private String srnm;
    private String srit;
    private String srid;
    private String scnm;
    private String scit;
    private String scid;
    private String stnt;
    private String detr;
    private String torp;
    private String dorp;
    private String tptr;
    private String stcb;
    private String aosp;
    private String tosc;
    private String stcr;
    private String icnm;
    private String istp;
    private String isnm;
    private String isps;
    private String alnm;
    private String aitp;
    private String alid;
    private String altp;
    private String istn;
    private String iitp;
    private String isid;
    private String rltp;
    private String bnnm;
    private String bitp;
    private String bnid;
    private String isog;
    private double isat;
    private double isfe;
    private String ispt;
    private String ctes;
    private String tstm;
    private String trcd;
    private String ittp;
    private String crtp;
    private double crat;
    private String crdr;
    private String cstp;
    private String caoi;
    private String tcan;
    private String rotf;
    private String code;
    private String itnm;
    private String bntn;
    private String mirs;
    private String otpr;
    private String stnm;
    private String ocit;
    private String odrp;
    private String oitp;
    private String orit;
    private String orxn;
    private String rpnm;
    private String sctl;
    private String rpdt;
    private String sear;
    private String seei;
    private String setn;

    public void print() {
        System.out.println(String.format(
                "SusReport:  ricd%s  finc %s  senm %s  setp %s  seid %s  sevc%s  srnm%s  srit %s  srid%s  scnm %s  scit%s  scid%s  stnt%s  detr%s  torp%s  dorp%s  tptr%s  stcb%s  aosp%s  tosc%s  stcr%s  icnm%s  istp%s  isnm%s  isps%s  alnm%s  aitp%s  alid%s  altp%s  istn%s  iitp%s  isid%s  rltp%s  bnnm%s  bitp%s  bnid%s  isog%s  isat%s  isfe%s  ispt%s  ctes%s  tstm%s  trcd%s  ittp%s  crtp%s  crat%s  crdr%s  cstp%s  caoi%s  tcan%s  rotf%s  code%s  itnm%s  bntn%s  mirs%s  otpr%s  stnm%s  ocit%s  odrp%s  oitp%s  orit%s  orxn%s  rpnm%s  sctl%s  rpdt%s  sear%s  seei%s  setn%s",
                ricd, finc, senm, setp, seid, sevc, srnm, srit, srid, scnm, scit, scid, stnt, detr, torp, dorp, tptr,
                stcb, aosp, tosc, stcr, icnm, istp, isnm, isps, alnm, aitp, alid, altp, istn, iitp, isid, rltp, bnnm,
                bitp, bnid, isog, isat, isfe, ispt, ctes, tstm, trcd, ittp, crtp, crat, crdr, cstp, caoi, tcan, rotf,
                code, itnm, bntn, mirs, otpr, stnm, ocit, odrp, oitp, orit, orxn, rpnm, sctl, rpdt, sear, seei, setn));
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

    public String getSenm() {
        return senm;
    }

    public void setSenm(String senm) {
        this.senm = senm;
    }

    public String getSetp() {
        return setp;
    }

    public void setSetp(String setp) {
        this.setp = setp;
    }

    public String getSeid() {
        return seid;
    }

    public void setSeid(String seid) {
        this.seid = seid;
    }

    public String getSevc() {
        return sevc;
    }

    public void setSevc(String sevc) {
        this.sevc = sevc;
    }

    public String getSrnm() {
        return srnm;
    }

    public void setSrnm(String srnm) {
        this.srnm = srnm;
    }

    public String getSrit() {
        return srit;
    }

    public void setSrit(String srit) {
        this.srit = srit;
    }

    public String getSrid() {
        return srid;
    }

    public void setSrid(String srid) {
        this.srid = srid;
    }

    public String getScnm() {
        return scnm;
    }

    public void setScnm(String scnm) {
        this.scnm = scnm;
    }

    public String getScit() {
        return scit;
    }

    public void setScit(String scit) {
        this.scit = scit;
    }

    public String getScid() {
        return scid;
    }

    public void setScid(String scid) {
        this.scid = scid;
    }

    public String getStnt() {
        return stnt;
    }

    public void setStnt(String stnt) {
        this.stnt = stnt;
    }

    public String getDetr() {
        return detr;
    }

    public void setDetr(String detr) {
        this.detr = detr;
    }

    public String getTorp() {
        return torp;
    }

    public void setTorp(String torp) {
        this.torp = torp;
    }

    public String getDorp() {
        return dorp;
    }

    public void setDorp(String dorp) {
        this.dorp = dorp;
    }

    public String getTptr() {
        return tptr;
    }

    public void setTptr(String tptr) {
        this.tptr = tptr;
    }

    public String getStcb() {
        return stcb;
    }

    public void setStcb(String stcb) {
        this.stcb = stcb;
    }

    public String getAosp() {
        return aosp;
    }

    public void setAosp(String aosp) {
        this.aosp = aosp;
    }

    public String getTosc() {
        return tosc;
    }

    public void setTosc(String tosc) {
        this.tosc = tosc;
    }

    public String getStcr() {
        return stcr;
    }

    public void setStcr(String stcr) {
        this.stcr = stcr;
    }

    public String getIcnm() {
        return icnm;
    }

    public void setIcnm(String icnm) {
        this.icnm = icnm;
    }

    public String getIstp() {
        return istp;
    }

    public void setIstp(String istp) {
        this.istp = istp;
    }

    public String getIsnm() {
        return isnm;
    }

    public void setIsnm(String isnm) {
        this.isnm = isnm;
    }

    public String getIsps() {
        return isps;
    }

    public void setIsps(String isps) {
        this.isps = isps;
    }

    public String getAlnm() {
        return alnm;
    }

    public void setAlnm(String alnm) {
        this.alnm = alnm;
    }

    public String getAitp() {
        return aitp;
    }

    public void setAitp(String aitp) {
        this.aitp = aitp;
    }

    public String getAlid() {
        return alid;
    }

    public void setAlid(String alid) {
        this.alid = alid;
    }

    public String getAltp() {
        return altp;
    }

    public void setAltp(String altp) {
        this.altp = altp;
    }

    public String getIstn() {
        return istn;
    }

    public void setIstn(String istn) {
        this.istn = istn;
    }

    public String getIitp() {
        return iitp;
    }

    public void setIitp(String iitp) {
        this.iitp = iitp;
    }

    public String getIsid() {
        return isid;
    }

    public void setIsid(String isid) {
        this.isid = isid;
    }

    public String getRltp() {
        return rltp;
    }

    public void setRltp(String rltp) {
        this.rltp = rltp;
    }

    public String getBnnm() {
        return bnnm;
    }

    public void setBnnm(String bnnm) {
        this.bnnm = bnnm;
    }

    public String getBitp() {
        return bitp;
    }

    public void setBitp(String bitp) {
        this.bitp = bitp;
    }

    public String getBnid() {
        return bnid;
    }

    public void setBnid(String bnid) {
        this.bnid = bnid;
    }

    public String getIsog() {
        return isog;
    }

    public void setIsog(String isog) {
        this.isog = isog;
    }

    public double getIsat() {
        return isat;
    }

    public void setIsat(double isat) {
        this.isat = isat;
    }

    public double getIsfe() {
        return isfe;
    }

    public void setIsfe(double isfe) {
        this.isfe = isfe;
    }

    public String getIspt() {
        return ispt;
    }

    public void setIspt(String ispt) {
        this.ispt = ispt;
    }

    public String getCtes() {
        return ctes;
    }

    public void setCtes(String ctes) {
        this.ctes = ctes;
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

    public String getIttp() {
        return ittp;
    }

    public void setIttp(String ittp) {
        this.ittp = ittp;
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

    public String getCrdr() {
        return crdr;
    }

    public void setCrdr(String crdr) {
        this.crdr = crdr;
    }

    public String getCstp() {
        return cstp;
    }

    public void setCstp(String cstp) {
        this.cstp = cstp;
    }

    public String getCaoi() {
        return caoi;
    }

    public void setCaoi(String caoi) {
        this.caoi = caoi;
    }

    public String getTcan() {
        return tcan;
    }

    public void setTcan(String tcan) {
        this.tcan = tcan;
    }

    public String getRotf() {
        return rotf;
    }

    public void setRotf(String rotf) {
        this.rotf = rotf;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getItnm() {
        return itnm;
    }

    public void setItnm(String itnm) {
        this.itnm = itnm;
    }

    public String getBntn() {
        return bntn;
    }

    public void setBntn(String bntn) {
        this.bntn = bntn;
    }

    public String getMirs() {
        return mirs;
    }

    public void setMirs(String mirs) {
        this.mirs = mirs;
    }

    public String getOtpr() {
        return otpr;
    }

    public void setOtpr(String otpr) {
        this.otpr = otpr;
    }

    public String getStnm() {
        return stnm;
    }

    public void setStnm(String stnm) {
        this.stnm = stnm;
    }

    public String getOcit() {
        return ocit;
    }

    public void setOcit(String ocit) {
        this.ocit = ocit;
    }

    public String getOdrp() {
        return odrp;
    }

    public void setOdrp(String odrp) {
        this.odrp = odrp;
    }

    public String getOitp() {
        return oitp;
    }

    public void setOitp(String oitp) {
        this.oitp = oitp;
    }

    public String getOrit() {
        return orit;
    }

    public void setOrit(String orit) {
        this.orit = orit;
    }

    public String getOrxn() {
        return orxn;
    }

    public void setOrxn(String orxn) {
        this.orxn = orxn;
    }

    public String getRpnm() {
        return rpnm;
    }

    public void setRpnm(String rpnm) {
        this.rpnm = rpnm;
    }

    public String getSctl() {
        return sctl;
    }

    public void setSctl(String sctl) {
        this.sctl = sctl;
    }

    public String getRpdt() {
        return rpdt;
    }

    public void setRpdt(String rpdt) {
        this.rpdt = rpdt;
    }

    public String getSear() {
        return sear;
    }

    public void setSear(String sear) {
        this.sear = sear;
    }

    public String getSeei() {
        return seei;
    }

    public void setSeei(String seei) {
        this.seei = seei;
    }

    public String getSetn() {
        return setn;
    }

    public void setSetn(String setn) {
        this.setn = setn;
    }
}
