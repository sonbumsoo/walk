package com.weWalk.together.vo;

public class CodeVO {
	
	private String code; // 코드분류
	private String code_nm; // 코드 분류 이름
	private String code_dtl_val; // 코드 상세 값 
	private String code_dtl_nm; // 코드 상세 이름
	private String comment; // 코드 설명
	private String del_yn; // 사용여부
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCode_nm() {
		return code_nm;
	}
	public void setCode_nm(String code_nm) {
		this.code_nm = code_nm;
	}
	public String getCode_dtl_val() {
		return code_dtl_val;
	}
	public void setCode_dtl_val(String code_dtl_val) {
		this.code_dtl_val = code_dtl_val;
	}
	public String getCode_dtl_nm() {
		return code_dtl_nm;
	}
	public void setCode_dtl_nm(String code_dtl_nm) {
		this.code_dtl_nm = code_dtl_nm;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	
	@Override
	public String toString() {
		return "CodeVo [code=" + code + ", code_nm=" + code_nm + ", code_dtl_val=" + code_dtl_val + ", code_dtl_cd="
				+ code_dtl_nm + ", comment=" + comment + ", del_yn=" + del_yn + "]";
	}

}
