package com.model2.mvc.service.domain;

import java.sql.Date;

public class Chatting {
	
	private int chattingNo;
	private String userId;
	private String message;
	private Date date;
	
	public String getUserId() {
		return userId;
	}
	public String getMessage() {
		return message;
	}
	public Date getDate() {
		return date;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	public int getChattingNo() {
		return chattingNo;
	}
	public void setChattingNo(int chattingNo) {
		this.chattingNo = chattingNo;
	}
	@Override
	public String toString() {
		return "Chatting [chattingNo=" + chattingNo + 
				", userId=" + userId + ", message=" + message + ", date=" + date + "]";
	}

	
}
