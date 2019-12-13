package com.model2.mvc.service.payment.test;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.service.domain.Payment;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.payment.PaymentService;
import com.model2.mvc.service.purchase.PurchaseService;


/*
 *	FileName :  UserServiceTest.java
 * �� JUnit4 (Test Framework) �� Spring Framework ���� Test( Unit Test)
 * �� Spring �� JUnit 4�� ���� ���� Ŭ������ ���� ������ ��� ���� �׽�Ʈ �ڵ带 �ۼ� �� �� �ִ�.
 * �� @RunWith : Meta-data �� ���� wiring(����,DI) �� ��ü ����ü ����
 * �� @ContextConfiguration : Meta-data location ����
 * �� @Test : �׽�Ʈ ���� �ҽ� ����
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-aspect.xml",
									"classpath:config/context-common.xml",
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml"})
public class PaymentServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private PurchaseService purchaseService;
	@Test
	public void testAddPayment() throws Exception {
		
		
		Payment payment = new Payment();	
		payment.setBuyer_id("user19");
		payment.setPrice(6000);
		payment.setPaymentByMoney(3000);
		payment.setPaymentByWishPay(3000);
		payment.setProdNo(10001);
		paymentService.addPayment(payment);
		


	}
	
	//@Test
	public void testGetPayment() throws Exception {
		

		
		Payment payment = paymentService.getPayment(10002);

		
		//==> API Ȯ��
		Assert.assertEquals(10001, payment.getPaymentNo());
		Assert.assertEquals("user19", payment.getBuyer_id());
	}
	
	
}