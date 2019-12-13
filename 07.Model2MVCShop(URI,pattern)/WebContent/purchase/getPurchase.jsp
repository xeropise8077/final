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
$( function(){
	
	
	
	//Ȯ�� ��ư
	$("button.btn.btn-primary").on("click",function(){
		self.location="/purchase/listPurchase"
	});
	
	//���� ����
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
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		
		<div class="page-header">
	       <h3 class=" text-info">����������ȸ</h3>
	       <h5 class="text-muted">�� ������ <strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.</h5>
	    </div>
	    
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���� ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${ purchase.tranNo }</div>
		</div>
		
		<hr>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${ purchase.purchaseProd.prodNo }</div>
		</div>		
		
		<hr>
				
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>������ ���̵�</strong></div>
			<div class="col-xs-8 col-md-4">${ purchase.buyer.userId }</div>
		</div>			
		
		<hr>
					    
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���� ���</strong></div>
	  		<c:choose>
	  			<c:when test="${ purchase.paymentOption.trim()=='1' }">
					<div class="col-xs-8 col-md-4">���� ����</div>
				</c:when>
				
				<c:otherwise>
					<div class="col-xs-8 col-md-4">�ſ� ����</div>
				</c:otherwise>				
			</c:choose>
		</div>		
		
		<hr>
				
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>������ �̸�</strong></div>
			<div class="col-xs-8 col-md-4">${ purchase.receiverName }</div>
		</div>	
		
		<hr>
				
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>������ ����ó</strong></div>
			<div class="col-xs-8 col-md-4">${ purchase.receiverPhone }</div>
		</div>		
		
		<hr>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>������ �ּ�</strong></div>
			<div class="col-xs-8 col-md-4">${ purchase.divyAddr }</div>
		</div>	
		
		<hr>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">Ȯ��</button>
	  		</div>
		</div>
		<hr>
				
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary" id="update">������������</button>
	  		</div>
		</div>
		
		<script>
		</script>
		<br>					
	</div>



</body>
</html>