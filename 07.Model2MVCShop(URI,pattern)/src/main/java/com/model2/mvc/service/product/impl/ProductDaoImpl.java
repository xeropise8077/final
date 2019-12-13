package com.model2.mvc.service.product.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductDao;

@Repository("productDaoImpl")
public class ProductDaoImpl implements ProductDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public ProductDaoImpl() {
		System.out.println("::"+getClass()+" default Constructor Call.....");
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("::"+getClass()+".setSqlSession() Call....");
		this.sqlSession = sqlSession;		
		
	}
	
	@Override
	public int addProduct(Product product) throws Exception {
		return sqlSession.insert("ProductMapper01.addProduct",product);
	}

	@Override
	public Product getProduct(int prodNo) throws Exception {
	
		return (Product) sqlSession.selectOne("ProductMapper01.findProduct", prodNo);
	}
	@Override
	public int updateProduct(Product product) throws Exception {
		
		return sqlSession.update("ProductMapper01.updateProduct",product);
	}

	@Override
	public List<Product> getProductList(Search search) throws Exception {

		return sqlSession.selectList("ProductMapper01.getProductList",search);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		
		return sqlSession.selectOne("ProductMapper01.getTotalCount",search);
	}

	@Override
	public List<Product> getProductListVanila(Search search) throws Exception {
		
		return sqlSession.selectList("ProductMapper01.getProductListVanila",search);
	}

	@Override
	public Product recentProduct() throws Exception {
		
		return sqlSession.selectOne("ProductMapper01.recentProduct");
	}

	@Override
	public int getTotalCountVanila(Search search) throws Exception {
		
		return sqlSession.selectOne("ProductMapper01.getTotalCountVanila",search);
	}

}
