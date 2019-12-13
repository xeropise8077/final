package com.model2.mvc.web.etc;



import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RestController;




//==> 회원관리 RestController
@RestController
@RequestMapping("/etc/*")
public class EtcRestController {
	/*
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method 구현 않음
	*/
	
	public EtcRestController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping( value="json/getCurrency", method=RequestMethod.GET ,produces = "application/text; charset=utf8")
	public String getCurrency( ) throws Exception{
		
		System.out.println("/etc/json/getCurrency : GET");
		
		/*
        Document 클래스 : 연결해서 얻어온 HTML 전체 문서
        Element 클래스  : Documnet의 HTML 요소
        Elements 클래스 : Element가 모인 자료형
	    */       
	    String url = "https://search.naver.com/search.naver?sm=top_hty&fbm=0&ie=utf8&query=%ED%99%98%EC%9C%A8%EC%A0%95%EB%B3%B4";
	    String selector = "div.rate_table_bx._table table"; //썸네일 셀렉터
	    
	    Document doc = null;    
	    
	 
	    doc = Jsoup.connect(url).get(); // -- 1. get방식의 URL에 연결해서 가져온 값을 doc에 담는다.
	    
	    Elements titles = doc.select(selector); // -- 2. doc에서 selector의 내용을 가져와 Elemntes 클래스에 담는다.
	    //String a =URLEncoder.encode(titles.html() , "EUC-KR");
		return titles.html();
	    
	}
	
	@RequestMapping( value="json/getKeyword", method=RequestMethod.GET,produces = "application/text; charset=utf8")
	public String getKeyword() throws Exception {
		
	
        System.setProperty("webdriver.chrome.driver","chromedriver.exe");
        
        //GUI가 없는 headless option 생성
        ChromeOptions options = new ChromeOptions();
        options.addArguments("headless");
        
        // 가상(?) 브라우저를 옵션 넣어서 생성
        //WebDriver driver = new ChromeDriver(options);
        
        // 브라우저 띄워서 생성
        WebDriver driver = new ChromeDriver(options);
        
        String base_url ="https://datalab.naver.com/keyword/realtimeList.naver?where=main";
        
        driver.get(base_url);
        
        
   
        WebElement first = driver.findElement(By.className("ranking_box"));
        
        //inner html 얻기 
        //System.out.println( first.getAttribute("innerHTML") );
        
        //outer html 얻기
        System.out.println( first.getAttribute("outerHTML"));		
		
		return first.getAttribute("outerHTML");
	}
	

	
}
