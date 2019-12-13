<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



    
    
<html>
<head>

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
   
   	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
   
<script>
$( function(){
	
	
	
	//확인 버튼
	$("button.btn.btn-primary").on("click",function(){
		self.location="/purchase/listPurchase"
	});
	
	//정보 수정
	$("#update").on("click",function(){
		
		self.location="/purchase/updatePurchaseView?tranNo="+${ purchase.tranNo };
	});	
});
</script>
<title>Insert title here</title>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		
		<div class="page-header">
	       <h3 class=" text-info">구매정보조회</h3>
	       <h5 class="text-muted">내 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
	    </div>
	    
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매 번호</strong></div>
			<div class="col-xs-8 col-md-4">${ purchase.tranNo }</div>
		</div>
		
		<hr>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품 번호</strong></div>
			<div class="col-xs-8 col-md-4">${ purchase.purchaseProd.prodNo }</div>
		</div>		
		
		<hr>
				
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매자 아이디</strong></div>
			<div class="col-xs-8 col-md-4">${ purchase.buyer.userId }</div>
		</div>			
		
		<hr>
					    
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매 방법</strong></div>
	  		<c:choose>
	  			<c:when test="${ purchase.paymentOption.trim()=='1' }">
					<div class="col-xs-8 col-md-4">현금 구매</div>
				</c:when>
				
				<c:otherwise>
					<div class="col-xs-8 col-md-4">신용 구매</div>
				</c:otherwise>				
			</c:choose>
		</div>		
		
		<hr>
				
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매자 이름</strong></div>
			<div class="col-xs-8 col-md-4">${ purchase.receiverName }</div>
		</div>	
		
		<hr>
				
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매자 연락처</strong></div>
			<div class="col-xs-8 col-md-4">${ purchase.receiverPhone }</div>
		</div>		
		
		<hr>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매자 주소</strong></div>
			<div class="col-xs-8 col-md-4">${ purchase.divyAddr }</div>
		</div>	
		
		<hr>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">확인</button>
	  		</div>
		</div>
		<hr>
				
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary" id="update">구매정보수정</button>
	  		</div>
		</div>
		
		<script>
		</script>
		<br>					
	</div>



</body>
</html>