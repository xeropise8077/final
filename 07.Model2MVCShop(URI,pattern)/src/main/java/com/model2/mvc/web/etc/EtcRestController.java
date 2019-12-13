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




//==> ȸ������ RestController
@RestController
@RequestMapping("/etc/*")
public class EtcRestController {
	/*
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method ���� ����
	*/
	
	public EtcRestController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping( value="json/getCurrency", method=RequestMethod.GET ,produces = "application/text; charset=utf8")
	public String getCurrency( ) throws Exception{
		
		System.out.println("/etc/json/getCurrency : GET");
		
		/*
        Document Ŭ���� : �����ؼ� ���� HTML ��ü ����
        Element Ŭ����  : Documnet�� HTML ���
        Elements Ŭ���� : Element�� ���� �ڷ���
	    */       
	    String url = "https://search.naver.com/search.naver?sm=top_hty&fbm=0&ie=utf8&query=%ED%99%98%EC%9C%A8%EC%A0%95%EB%B3%B4";
	    String selector = "div.rate_table_bx._table table"; //����� ������
	    
	    Document doc = null;    
	    
	 
	    doc = Jsoup.connect(url).get(); // -- 1. get����� URL�� �����ؼ� ������ ���� doc�� ��´�.
	    
	    Elements titles = doc.select(selector); // -- 2. doc���� selector�� ������ ������ Elemntes Ŭ������ ��´�.
	    //String a =URLEncoder.encode(titles.html() , "EUC-KR");
		return titles.html();
	    
	}
	
	@RequestMapping( value="json/getKeyword", method=RequestMethod.GET,produces = "application/text; charset=utf8")
	public String getKeyword() throws Exception {
		
	
        System.setProperty("webdriver.chrome.driver","chromedriver.exe");
        
        //GUI�� ���� headless option ����
        ChromeOptions options = new ChromeOptions();
        options.addArguments("headless");
        
        // ����(?) �������� �ɼ� �־ ����
        //WebDriver driver = new ChromeDriver(options);
        
        // ������ ����� ����
        WebDriver driver = new ChromeDriver(options);
        
        String base_url ="https://datalab.naver.com/keyword/realtimeList.naver?where=main";
        
        driver.get(base_url);
        
        
   
        WebElement first = driver.findElement(By.className("ranking_box"));
        
        //inner html ��� 
        //System.out.println( first.getAttribute("innerHTML") );
        
        //outer html ���
        System.out.println( first.getAttribute("outerHTML"));		
		
		return first.getAttribute("outerHTML");
	}
	

	
}
