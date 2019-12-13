package com.model2.mvc.service.payment.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Payment;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.payment.PaymentDao;
import com.model2.mvc.service.payment.PaymentService;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.user.UserDao;

@Service("paymentServiceImpl")
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentDao paymentDao;
	
	public PaymentServiceImpl() {
		System.out.println("::"+getClass()+" default Constructor Call.....");
	}
	

	public void setPaymentDao(PaymentDao paymentDao) {
		System.out.println("::"+getClass()+".setProductDao Call......");
		this.paymentDao=paymentDao;
		
	}
	
	@Override
	public int addPayment(Payment payment) throws Exception {
		
		return paymentDao.addPayment(payment);
		
	}

	@Override
	public Payment getPayment(int tranNo) throws Exception {
		
		return (Payment)paymentDao.getPayment(tranNo);
	}



}
