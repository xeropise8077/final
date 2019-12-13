<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<html>
<head>
<title>Insert title here</title>

<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<script type="text/javascript">

$(function(){
	
	$("button").on("click",function(){
		self.location="/product/listProductVanila";
	});
	
});

</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">�� �� ��</h3>
	       <h5 class="text-muted">������ ����  <strong class="text-danger">������ �Ϸ�</strong>�ƽ��ϴ�.</h5>
	    </div>

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${ purchase.purchaseProd.prodNo}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>������ ���̵�</strong></div>
			<div class="col-xs-8 col-md-4">${ purchase.buyer.userId}</div>
		</div>		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���Ź��</strong></div>
			<div class="col-xs-8 col-md-4">
				<c:choose>
					<c:when test="${ purchase.paymentOption.trim()=='1' }">
						���ݱ���
					</c:when>
					
					<c:otherwise>
						�ſ뱸��
					</c:otherwise>
				</c:choose>
			</div>
		</div>		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������̸�</strong></div>
			<div class="col-xs-8 col-md-4">${  purchase.receiverName }</div>		
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>������ ����ó</strong></div>
			<div class="col-xs-8 col-md-4">${ purchase.receiverPhone }</div>		
		</div>		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>������ �ּ�</strong></div>
			<div class="col-xs-8 col-md-4">${ purchase.divyAddr }</div>		
		</div>			
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>������ ��û����</strong></div>
			<div class="col-xs-8 col-md-4">${ purchase.divyRequest }</div>		
		</div>	
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>����������</strong></div>
			<div class="col-xs-8 col-md-4">${ purchase.divyDate }</div>		
		</div>			
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">Ȯ��</button>
	  		</div>
		</div>
		<hr>						
	
	</div>

</body>
</html>