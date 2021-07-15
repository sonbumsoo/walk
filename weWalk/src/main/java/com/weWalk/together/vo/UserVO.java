package com.weWalk.together.vo;

public class UserVO {

	private String id;
	private String email;
	private String password;
	private String name;
	private String phone_num;
	private String phone_front;
	private String phone_mid;
	private String phone_end;
	private String addr;
	private String addr1;
	private String addr2;
	private String addr3;
	private String member_type_cd;
	private String authkey = "";
	private String member_state_cd;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone_num() {
		return phone_num;
	}
	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}
	public String getPhone_front() {
		return phone_front;
	}
	public void setPhone_front(String phone_front) {
		this.phone_front = phone_front;
	}
	public String getPhone_mid() {
		return phone_mid;
	}
	public void setPhone_mid(String phone_mid) {
		this.phone_mid = phone_mid;
	}
	public String getPhone_end() {
		return phone_end;
	}
	public void setPhone_end(String phone_end) {
		this.phone_end = phone_end;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAddr3() {
		return addr3;
	}
	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}
	public String getMember_type_cd() {
		return member_type_cd;
	}
	public void setMember_type_cd(String member_type_cd) {
		this.member_type_cd = member_type_cd;
	}
	public String getAuthkey() {
		return authkey;
	}
	public void setAuthkey(String authkey) {
		this.authkey = authkey;
	}
	public String getMember_state_cd() {
		return member_state_cd;
	}
	public void setMember_state_cd(String member_state_cd) {
		this.member_state_cd = member_state_cd;
	}
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", email=" + email + ", password=" + password + ", name=" + name + ", phone_num="
				+ phone_num + ", phone_front=" + phone_front + ", phone_mid=" + phone_mid + ", phone_end=" + phone_end
				+ ", addr=" + addr + ", addr1=" + addr1 + ", addr2=" + addr2 + ", addr3=" + addr3 + ", member_type_cd="
				+ member_type_cd + ", authkey=" + authkey + ", member_state_cd=" + member_state_cd + "]";
	}
	
	
	

}
