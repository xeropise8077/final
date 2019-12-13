package com.model2.mvc.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.purchase.PurchaseDao;

@Repository("purchaseDaoImpl")
public class PurchaseDaoImpl implements PurchaseDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	

	public PurchaseDaoImpl() {
		System.out.println("::"+getClass()+" default Constructor Call.....");
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("::"+getClass()+".setSqlSession() Call....");
		this.sqlSession = sqlSession;		
	}
	
	@Override
	public int addPurchase(Purchase purchase) throws Exception {
		return sqlSession.insert("PurchaseMapper01.addPurchase",purchase);
		
		
	}

	@Override
	public Purchase getPurchase(int tranNo) throws Exception {
		
		return sqlSession.selectOne("PurchaseMapper01.findPurchase",tranNo);
	}

	@Override
	public Purchase getPurchase2(int ProdNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Purchase> getPurchaseList(Search search, String buyerId) throws Exception {
		
		Map<String , Object>  map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("buyerId", buyerId);
		
		

		
		return sqlSession.selectList("PurchaseMapper01.getPurchaseList",map);
	}

	@Override
	public List<Purchase> getSaleList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updatePurchase(Purchase purchase) throws Exception {
		return sqlSession.update("PurchaseMapper01.updatePurchase",purchase);
		
	}

	@Override
	public int updateTranCode(Purchase purchase) throws Exception {
		return sqlSession.update("PurchaseMapper01.updateTranCode",purchase);
		
	}

	@Override
	public int getTotalCount(Search search, String buyerId) throws Exception {
		Map<String , Object>  map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("buyerId", buyerId);		
		
		return sqlSession.selectOne("PurchaseMapper01.getTotalCount",map);
	}

}
