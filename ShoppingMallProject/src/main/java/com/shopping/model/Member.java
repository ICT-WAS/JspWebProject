package com.shopping.model;

public class Member {
	private long member_id;
	private String id;
	private String name;
	private String nickname;
	private String password;
	private String email;
	private String phoneNumber;
	private String createdAt;
	private String updatedAt;
	private String lastLogin;
	private int status; // 1이 true / 0이 false
	private String birthday;
	private long point;
	public Member(long member_id, String id, String name, String nickname, String password, String email,
			String phoneNumber, String createdAt, String updatedAt, String lastLogin, int status, String birthday,
			long point) {
		super();
		this.member_id = member_id;
		this.id = id;
		this.name = name;
		this.nickname = nickname;
		this.password = password;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.lastLogin = lastLogin;
		this.status = status;
		this.birthday = birthday;
		this.point = point;
	}
	public Member() {
		super();
	}
	public long getMember_id() {
		return member_id;
	}
	public void setMember_id(long member_id) {
		this.member_id = member_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public String getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(String updatedAt) {
		this.updatedAt = updatedAt;
	}
	public String getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public long getPoint() {
		return point;
	}
	public void setPoint(long point) {
		this.point = point;
	}
	@Override
	public String toString() {
		return "Member [member_id=" + member_id + ", id=" + id + ", name=" + name + ", nickname=" + nickname
				+ ", password=" + password + ", email=" + email + ", phoneNumber=" + phoneNumber + ", createdAt="
				+ createdAt + ", updatedAt=" + updatedAt + ", lastLogin=" + lastLogin + ", status=" + status
				+ ", birthday=" + birthday + ", point=" + point + "]";
	}
	
	
}
