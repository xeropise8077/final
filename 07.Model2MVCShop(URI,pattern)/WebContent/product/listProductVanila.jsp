<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>상품 목록 조회</title>

	<meta charset="EUC-KR">
	
	
<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>


<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
 <!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<script type="text/javascript">
	



	// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("action","/product/listProductVanila?menu=search" ).attr("method","POST").submit();
	}
	
	function enterkey(){
		if (event.keyCode == 13) {
			 
            // 엔터키가 눌렸을 때 실행할 내용
			fncGetUserList('1');
       }
	}
		
		
		
	$(function(){
		$("td:nth-child(2)").css('color','red');
		$("td:nth-child(2)").css('text-decoration','underline');
		
		$('button.btn.btn-default').on("click",function(){
			fncGetUserList('1');
		});
		
		//상품 정보 확인
		$("button").on("click", function(){	
			self.location ="/product/getProduct?prodNo="+$(this).next().val().trim()+"&menu=search";	
		});
		
		// 상품 구입
		$("a[href='#']").on("click", function(){
			self.location ="/purchase/addPurchaseView?prodNo="+$(this).prev().val().trim();
		});
		
		// 무한 스크롤
		var number = 2;
		
		
	    if ($(window).scrollTop() != null) {
	    	
		    	$.ajax(
		    		{
		    			url: "/product/json/getProductListVanila",
		    			method : "POST",
		    			data : JSON.stringify({
		    					currentPage : number,
		    					pageSize : 3
		    			}),
		    			contentType : "application/json; charset=UTF-8",
		    			dataType : "json",
		    			success : function(JSONData, status) {
		    				
		    				for(i=0; i<JSONData.list.length; i++){
		    					
		    					console.log(JSONData.list[i])
		    					
		    					var string="<div class='col-sm-6 col-md-4'>"
		    								+"<div class='thumbnail'>"		    				    				
		    										+"<img src='../images/uploadFiles/"+JSONData.list[i].fileName.split('@')[0]+"' style='width : 150px; height:150px ;' alt='My Image'>"
		    				      				+"<div class='caption text-center'>"
		    				        				+"<h3>상품명</h3>"
		    				        				+"<p>"+JSONData.list[i].prodName+"</p>"	
		    				        				+"<h3>가 격</h3>"
		    				        				+"<p>"+JSONData.list[i].price+"</p>"					            	        
		    				        	    	+"<p><button class='btn btn-primary'>상세정보</button>"
		    				           			+"<input type='hidden' value='"+JSONData.list[i].prodNo+"'>"
		    				        			+"<a href='#' class='btn btn-default' role='button'>즉시구입</a></p>"
		    				      					+"</div>"
		    				      				+"</div>"
		    				      			+"</div>"
		    				      			
		    				     $("div.container").last().append(string).css({'display': 'block', 'opacity': 0}).animate({'opacity': 1}, 300);
		    				}
		    			}
		    			
		    		})
				number++;		    	
	     			 
	    } 
		
		
			$(window).scroll(function() {
			
			
			    if ( $(window).scrollTop() == ( $(document).height() - $(window).height() ) ) {
		    		
			    	$.ajax(
			       	  		{
		       	  			url : "/product/json/getProductListVanila",
		       	  			method : "POST",
		       	  			data : JSON.stringify({
		       	  					currentPage : number,
		       	  					pageSize : 3
		       	  				}),
		       	  			contentType:'application/json; charset=utf-8',
		       	  			dataType : "json",
		       	  			success : function(JSONData, status) {
								
		       	  				//var array = JSONData.list[1].fileName.split('@');
		       	  				
		       	  				for(i=0; i<JSONData.list.length; i++){	
		    						var string="<div class='col-sm-6 col-md-4'>"
    									+"<div class='thumbnail'>"
    										for(j=0; j<JSONData.list[i].fileName.split('@').length; j++){
    											if( JSONData.list[i].fileName.split('@')[j] != null && JSONData.list[i].fileName.split('@')[j].length>1 ){
    										string+="<img src='../images/uploadFiles/"+JSONData.list[i].fileName.split('@')[j]+"' style='width : 150px; height:150px ;' alt='My Image'>"
    											}
    										}
    				      				string+="<div class='caption text-center'>"
    				        				+"<h3>상품명</h3>"
    				        				+"<p>"+JSONData.list[i].prodName+"</p>"	
    				        				+"<h3>가 격</h3>"
    				        				+"<p>"+JSONData.list[i].price+"</p>"					            	        
    				        	    	+"<p><button class='btn btn-primary'>상세정보</button>"
    				           			+"<input type='hidden' value='"+JSONData.list[i].prodNo+"'>"
    				        			+"<a href='#' class='btn btn-default' role='button'>즉시구입</a></p>"
    				      					+"</div>"
    				      				+"</div>"
    				      			+"</div>"
    				      			$("div.container").last()
    				  		   //$("div.container").last().append(string);
    				  		   $(string).hide().appendTo($("div.container").last()).fadeIn(1000);
    				      			
		       	  			}
		       	  				
		       	  			}
		     			 })//end of ajax
		     			 
		     			 number++;
		    			}// end of if
		    
		    		})//end of scroll
     });
	
</script>

<style>
#thumbNail {
	display : inline;
}

</style>
</head>

<body>
	<!-- toolbar start -->
	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	<!-- toolbar end -->
	

	<!-- 화면구성 Start -->
	
	<div class="container">
		
		<div class="page-header text-info">
			<h3>상품 목록 조회</h3>
		</div>
		
		<div class="row">
			
			<div class="col-md-6 text-left">
				<p class="text-primary">
					전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
				</p>
			</div>
	
			<div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm">
					<div class="form-group">
						<select class="form-control" name="searchCondition">
							<option value="0"
								${ search.searchCondition=="0" ? 'selected' : '' }>상품번호</option>
							<option value="1"
								${ search.searchCondition=="1" ? 'selected' : '' }>상품명</option>
							<option value="2"
								${ search.searchCondition=="2" ? 'selected' : '' }>가격</option>						
						</select>
					</div>
					
					<div class="form-group">
						<label class="sr-only" for="searchKeyword">검색어</label>
						<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="검색어"
							value="${ search.searchKeyword }" onkeydown="enterkey()">
					</div>
					
					 <button type="button" class="btn btn-default">검색</button>

			
					 
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>					 
				</form>
			</div>
		</div>
		<!-- row end -->
		   
			<c:forEach var="i" items="${ list }" begin="0">
				<c:set var="Product" value="${ i }" />		

				  <div class="col-sm-6 col-md-4">
				    <div class="thumbnail">												<!-- 일부러 하나만 나오게 처리해 놓음 -->
						<c:forTokens items="${ Product.fileName }" delims="@" var="fileName" begin="0" end="0">
							<img src="../images/uploadFiles/${ fileName }" style="width : 150px; height:150px ;" alt="My Image">
						</c:forTokens>
				      <div class="caption text-center">
				        <h3>상품명</h3>
				        <p>${ Product.prodName }</p>	
				        <h3>가 격</h3>
				        <p>${ Product.price }</p>					        
				        	        	        
				        <p><button class="btn btn-primary">상세정보</button>
				           <input type="hidden" value="${ Product.prodNo }">
				        <a href="#" class="btn btn-default" role="button">즉시구입</a></p>
				      </div>
				    </div>
				  </div>
	
			</c:forEach>
	</div>
	



</body>
</html>