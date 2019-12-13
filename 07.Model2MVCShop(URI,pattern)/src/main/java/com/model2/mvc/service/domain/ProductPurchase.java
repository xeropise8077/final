package com.model2.mvc.service.domain;

import java.sql.Date;

public class ProductPurchase {

	private String fileName;
	private String manuDate;
	private int price;
	private String prodDetail;
	private String prodName;
	private int prodNo;
	private Date regDate;	
	private String tranCode;
	private int tranNo;
	private int stockCount;	
	
	public String getFileName() {
		
		return fileName;
	}
	public String getManuDate() {
		return manuDate;
	}
	public int getPrice() {
		return price;
	}
	public String getProdDetail() {
		return prodDetail;
	}
	public String getProdName() {
		return prodName;
	}
	public int getProdNo() {
		return prodNo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public String getTranCode() {
		return tranCode;
	}
	public int getTranNo() {
		return tranNo;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public void setManuDate(String manuDate) {
		this.manuDate = manuDate;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setProdDetail(String prodDetail) {
		this.prodDetail = prodDetail;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public void setTranCode(String tranCode) {
		this.tranCode = tranCode;
	}
	public void setTranNo(int tranNo) {
		this.tranNo = tranNo;
	}
	@Override
	public String toString() {
		return "ProductPurchase [fileName=" + fileName + ", manuDate=" + manuDate + ", price=" + price + ", prodDetail="
				+ prodDetail + ", prodName=" + prodName + ", prodNo=" + prodNo + ", regDate=" + regDate + ", tranCode="
				+ tranCode + ", tranNo=" + tranNo +  ", stockCount=" + stockCount +"]";
	}
	public int getStockCount() {
		return stockCount;
	}
	public void setStockCount(int stockCount) {
		this.stockCount = stockCount;
	}
	
	
	
}
