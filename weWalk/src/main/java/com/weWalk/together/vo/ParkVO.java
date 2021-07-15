package com.weWalk.together.vo;

public class ParkVO {

	private String prkplceno; // 주차장 번호 
	private String prkplcenm; // 주차장 이름
	private String id; // 주차장 관리자
	private String rdnmadr; //도로명
	private String lnmadr; //지번
	private String prkcmprt; //구획
	private String basictime; //기본시간
	private String basiccharge; //기본요금
	private String daycmmtkt; //하루요금 
	private String monthcmmtkt; // 한달요금
	private String spcmnt; //전화번호
	private String latitude; //위도
	private String hardness; // 경도
	private String parkimg; // 주차장 이미지
	private String del_yn; // 사용여부
	private String coment; // 주차장 설명
	private String create_date; // 생성 날짜 
	private String apvl_date; // 승인일시
	private String prk_type_cd; // 주차장 구분
	private String prk_plc_cd; //주차장 유형
	private String prk_apvl_cd; // 주차장 승인 여부
	private String prk_metpay_cd; // 결제 방법
	
	public String getPrkplceno() {
		return prkplceno;
	}
	public void setPrkplceno(String prkplceno) {
		this.prkplceno = prkplceno;
	}
	public String getPrkplcenm() {
		return prkplcenm;
	}
	public void setPrkplcenm(String prkplcenm) {
		this.prkplcenm = prkplcenm;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRdnmadr() {
		return rdnmadr;
	}
	public void setRdnmadr(String rdnmadr) {
		this.rdnmadr = rdnmadr;
	}
	public String getLnmadr() {
		return lnmadr;
	}
	public void setLnmadr(String lnmadr) {
		this.lnmadr = lnmadr;
	}
	public String getPrkcmprt() {
		return prkcmprt;
	}
	public void setPrkcmprt(String prkcmprt) {
		this.prkcmprt = prkcmprt;
	}
	public String getBasictime() {
		return basictime;
	}
	public void setBasictime(String basictime) {
		this.basictime = basictime;
	}
	public String getBasiccharge() {
		return basiccharge;
	}
	public void setBasiccharge(String basiccharge) {
		this.basiccharge = basiccharge;
	}
	public String getDaycmmtkt() {
		return daycmmtkt;
	}
	public void setDaycmmtkt(String daycmmtkt) {
		this.daycmmtkt = daycmmtkt;
	}
	public String getMonthcmmtkt() {
		return monthcmmtkt;
	}
	public void setMonthcmmtkt(String monthcmmtkt) {
		this.monthcmmtkt = monthcmmtkt;
	}
	public String getSpcmnt() {
		return spcmnt;
	}
	public void setSpcmnt(String spcmnt) {
		this.spcmnt = spcmnt;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getHardness() {
		return hardness;
	}
	public void setHardness(String hardness) {
		this.hardness = hardness;
	}
	public String getParkimg() {
		return parkimg;
	}
	public void setParkimg(String parkimg) {
		this.parkimg = parkimg;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public String getComent() {
		return coment;
	}
	public void setComent(String coment) {
		this.coment = coment;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getApvl_date() {
		return apvl_date;
	}
	public void setApvl_date(String apvl_date) {
		this.apvl_date = apvl_date;
	}
	public String getPrk_type_cd() {
		return prk_type_cd;
	}
	public void setPrk_type_cd(String prk_type_cd) {
		this.prk_type_cd = prk_type_cd;
	}
	public String getPrk_plc_cd() {
		return prk_plc_cd;
	}
	public void setPrk_plc_cd(String prk_plc_cd) {
		this.prk_plc_cd = prk_plc_cd;
	}
	public String getPrk_apvl_cd() {
		return prk_apvl_cd;
	}
	public void setPrk_apvl_cd(String prk_apvl_cd) {
		this.prk_apvl_cd = prk_apvl_cd;
	}
	public String getPrk_metpay_cd() {
		return prk_metpay_cd;
	}
	public void setPrk_metpay_cd(String prk_metpay_cd) {
		this.prk_metpay_cd = prk_metpay_cd;
	}
	
	@Override
	public String toString() {
		return "ParkVO [prkplceno=" + prkplceno + ", prkplcenm=" + prkplcenm + ", id=" + id + ", rdnmadr=" + rdnmadr
				+ ", lnmadr=" + lnmadr + ", prkcmprt=" + prkcmprt + ", basictime=" + basictime + ", basiccharge="
				+ basiccharge + ", daycmmtkt=" + daycmmtkt + ", monthcmmtkt=" + monthcmmtkt + ", spcmnt=" + spcmnt
				+ ", latitude=" + latitude + ", hardness=" + hardness + ", parkimg=" + parkimg + ", del_yn=" + del_yn
				+ ", coment=" + coment + ", create_date=" + create_date + ", apvl_date=" + apvl_date + ", prk_type_cd="
				+ prk_type_cd + ", prk_plc_cd=" + prk_plc_cd + ", prk_apvl_cd=" + prk_apvl_cd + ", prk_metpay_cd="
				+ prk_metpay_cd + "]";
	}



}
