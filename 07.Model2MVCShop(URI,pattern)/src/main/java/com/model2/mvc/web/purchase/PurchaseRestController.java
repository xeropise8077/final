package com.model2.mvc.web.purchase;




import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseService;




//==> 상품관리 RestController
@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {
	
	///Field
	@Autowired
	private PurchaseService purchaseService;
	//setter Method 구현 않음
	

		
	public PurchaseRestController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping( value="json/getPurchase/{tranNo}", method=RequestMethod.GET)
	public Purchase getPurchase( @PathVariable int tranNo ) throws Exception {
		
			System.out.println("json/getPurchase/{tranNo}");
		
			Purchase purchase =purchaseService.getPurchase(tranNo);
			System.out.println(purchase);
		return purchase;
	}
	
	//나중에 하자
	@RequestMapping( value="json/getPurchaseList", method=RequestMethod.POST)
	public Map<String,Object> getPurchaseList( @RequestBody Map<String, Object> map) throws Exception {
			System.out.println("처음 들어왔을 때 : \n"+map);
			ObjectMapper objectMapper = new ObjectMapper();
			Search search =objectMapper.convertValue(map.get("search"), Search.class);
			String buyer = objectMapper.convertValue(map.get("userId"), String.class);
			map = purchaseService.getPurchaseList(search, buyer);
			System.out.println(map);
		return map;
	}
	
	@RequestMapping ( value="json/updatePurchase", method=RequestMethod.POST)
	public void updatePurchase( @RequestBody Purchase purchase) throws Exception {
		
		int i =purchaseService.updatePurchase(purchase);
		
		if(i==1) {
			System.out.println("update 성공");
		}else {
			System.out.println("update 실패");
		}
	}
	
	@RequestMapping ( value="json/addPurchase", method=RequestMethod.POST)
	public void addPurhcase( @RequestBody Purchase purchase ) throws Exception {
		
		purchaseService.addPurchase(purchase);
		
		System.out.println("완료");
	}
}
