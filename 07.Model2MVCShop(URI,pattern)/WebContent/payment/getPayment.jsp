<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



    
    
<html>
<head>
<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
$(function(){
	$("button").on("click",function(){
		self.location="/purchase/listPurchase";
		
	});
});

</script>
	


<title>Insert title here</title>
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	
	 <div class="container">
	 	
		<div class="page-header">
	       <h3 class=" text-info">������</h3>
	       <h5 class="text-muted">���� <strong class="text-danger">�Һ��</strong>�����ؾ��ϳ���</h5>
	    </div>
	    
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>������ ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${ payment.paymentNo }</div>
		</div>	 
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>������ ���̵�</strong></div>
			<div class="col-xs-8 col-md-4">${ payment.buyer_id }</div>
		</div>

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${ payment.prodNo }</div>
		</div>	
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>����</strong></div>
			<div class="col-xs-8 col-md-4">${ payment.count }</div>
		</div>	
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���� ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${ payment.tranNo }</div>
		</div>		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>����</strong></div>
			<div class="col-xs-8 col-md-4">${ payment.price }</div>
		</div>						
	 	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>����</strong></div>
			<div class="col-xs-8 col-md-4">${ payment.paymentByMoney }</div>
		</div>		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${ payment.paymentByWishPay }</div>
		</div>							
	 		 	
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">Ȯ��</button>
	  		</div>
		</div>
		
	 	
	 </div>



</body>
</html>