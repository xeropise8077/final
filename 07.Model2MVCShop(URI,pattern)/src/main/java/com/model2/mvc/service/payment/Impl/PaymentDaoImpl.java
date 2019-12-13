package com.model2.mvc.service.payment.Impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.service.domain.Payment;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.payment.PaymentDao;
import com.model2.mvc.service.product.ProductDao;

@Repository("paymentDaoImpl")
public class PaymentDaoImpl implements PaymentDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public PaymentDaoImpl() {
		System.out.println("::"+getClass()+" default Constructor Call.....");
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("::"+getClass()+".setSqlSession() Call....");
		this.sqlSession = sqlSession;		
		
	}
	
	@Override
	public int addPayment(Payment payment) throws Exception {
		
		return sqlSession.insert("PaymentMapper.addPayment",payment);
	}

	@Override
	public Payment getPayment(int tranNo) throws Exception {
	
		return (Payment) sqlSession.selectOne("PaymentMapper.findPayment", tranNo);
	}

}
