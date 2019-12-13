<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>구매 목록 조회</title>

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<script type="text/javascript">
	// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage);
		$("form").attr("method","POST").attr("action","/purchase/listPurchase").submit();
	}
	
	$(function(){
		$("td:nth-child(2)").css("text-decoration","underline").css("color","red");

		
		$("td:nth-child(2)").on("click",function(){
			self.location="/purchase/getPurchase?tranNo="+$(this).prev().text().trim();
		
		});
		
		//영수증
		$("td:nth-last-child(1)").on("click",function(){
		   
			self.location="/payment/getPayment?tranNo="+$(this).siblings().first().text().trim();
		});
		
		//간략 정보
		$("td:nth-last-child(2)").on("click",function(){
			var tranNo=$(this).siblings().first().text().trim();
			
	
			
			$.ajax( 
					{
						url : "/purchase/json/getPurchase/"+tranNo,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {
								
							var displayValue = "<h6>"
														+"구매번호 : "+JSONData.tranNo+"<br/>"
														+"물품번호 : "+JSONData.purchaseProd.prodNo+"<br/>"
														+"구매자 아이디 : "+JSONData.buyer.userId+"<br/>"
														+"구매자 성명 : "+JSONData.receiverName+"<br/>"
														+"배송 날짜 : "+JSONData.divyDate+"<br/>"
														+"</h6>";
							$("h6").remove();
							$( "#"+tranNo+"" ).html(displayValue);
						}
				});
			
			
			
		});
		
	});
</script>

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>구매목록조회</h3>
	    </div>

	
	
    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
    <div class="row">
    
	    <div class="col-md-6 text-left">
	    	<p class="text-primary">
	    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
	    	</p>
	    </div>	
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>구매번호</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>수령자 이름</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  onkeydown="enterkey()">
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	</div>
					
     <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >회원 ID</th>
            <th align="left">수령자이름</th>
            <th align="left">수령자번호</th>
            <th align="left">배송현황</th>
            <th align="left">정보수정</th>
            <th align="left">간략정보</th>
            <th align="left">지불정보</th>
          </tr>
        </thead>
      
      	<tbody>
		  <c:forEach var="i" items="${list}">
			<c:set var="purchase" value="${ i }" />
			<tr>
			  <td align="left">${ purchase.tranNo }</td>
			  <td align="left"  title="Click : 구매정보 확인">${ purchase.buyer.userId}</td>
			  <td align="left">${ purchase.receiverName }</td>
			  <td align="left">${ purchase.receiverPhone }</td>
			  <td align="left">
			  		<c:choose>
			  			<c:when test="${ purchase.getTranCode().trim().equals('3') }">
			  				배송 완료 상태 입니다.
			  			</c:when>
			  			
						<c:when test="${purchase.getTranCode().trim().equals('2') }">
							배송중 상태입니다
						</c:when>							
						
						<c:when test="${purchase.getTranCode().trim().equals('1') }">
							구매완료상태입니다. 
						</c:when>				  			
			  		</c:choose>
			  </td>
			  <td align="left">
				<c:if test="${purchase.getTranCode().trim().equals('2')}">
					<a href="/purchase/updateTranCode?tranNo=${ purchase.tranNo }">물건도착</a>
				</c:if>
			  </td>
			  <td align="left">
			  	   <span id="${ purchase.tranNo }" class="glyphicon glyphicon-list" aria-hidden="true"></span>
			  </td>
			  <td align="left">
			  	<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
			  </td>
			  
			</tr>
          </c:forEach>
        
        </tbody>
        
        </table>
        <!-- table end ////////////////////////////////////// -->

	</div>
	
	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... --> 	


</body>
</html>