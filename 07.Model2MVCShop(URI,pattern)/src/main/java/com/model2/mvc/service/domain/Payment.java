package com.model2.mvc.service.domain;

public class Payment {
	
	private int paymentNo;
	private String buyer_id;
	private int prodNo;
	private int count;
	private int tranNo;
	private int price;
	private int paymentByMoney;
	private int paymentByWishPay;
	
	public Payment() {
		
	}
	
	public Payment(String buyer_id, int prodNo, int price, int paymentByMoney, int paymentByWishPay) {
		this.buyer_id=buyer_id;
		this.prodNo=prodNo;
		this.price=price;
		this.paymentByMoney=paymentByMoney;
		this.paymentByWishPay=paymentByWishPay;
	}
	public int getPaymentNo() {
		return paymentNo;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public int getProdNo() {
		return prodNo;
	}
	public int getTranNo() {
		return tranNo;
	}
	public int getPrice() {
		return price;
	}
	public int getPaymentByMoney() {
		return paymentByMoney;
	}
	public int getPaymentByWishPay() {
		return paymentByWishPay;
	}
	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public void setTranNo(int tranNo) {
		this.tranNo = tranNo;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setPaymentByMoney(int paymentByMoney) {
		this.paymentByMoney = paymentByMoney;
	}
	public void setPaymentByWishPay(int paymentByWishPay) {
		this.paymentByWishPay = paymentByWishPay;
	}
	
	@Override
	public String toString() {
		return "Payment [paymentNo=" + paymentNo + ", buyer_id=" + buyer_id + ", prodNo=" + prodNo + ", count=" + count + ", tranNo="
				+ tranNo + ", price=" + price + ", paymentByMoney=" + paymentByMoney + ", paymentByWishPay="
				+ paymentByWishPay + "]";
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	
}
