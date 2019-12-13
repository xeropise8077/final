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
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-aspect.xml",
									"classpath:config/context-common.xml",
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml"})
public class PaymentServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
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

		
		//==> API 확인
		Assert.assertEquals(10001, payment.getPaymentNo());
		Assert.assertEquals("user19", payment.getBuyer_id());
	}
	
	
}