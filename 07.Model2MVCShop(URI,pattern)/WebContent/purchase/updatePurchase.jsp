<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  



<html>
<head>

	<meta charset="EUC-KR">
	
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


<title>�������� ����</title>

<script>

$( function(){
    $("button").on("click",function(){
    	
    	$("form").attr("method","POST").attr("action","/purchase/updatePurchase?tranNo=${ purchase.tranNo }").submit();
    	
    });
			
    $("a[href='#']").on("click",function(){
		history.go(-1);
	});
	
});

</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">������������</h3>
	       <h5 class="text-muted">�� ������ <strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.</h5>
	    </div>
	    
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="buyer.userId" class="col-sm-offset-1 col-sm-3 control-label">������ ���̵�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="buyer.userId" name="buyer.userId" value="${ purchase.buyer.userId }" readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">������ ���̵�� �����Ұ�</strong>
		      </span>
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">���� ���</label>
		    <div class="col-sm-4">
			     <select class="form-control" name="paymentOption" id="paymentOption">
					<c:choose>
						<c:when test="${purchase.getPaymentOption().trim().equals(1)}">
								<option value="1" selected="selected">���ݱ���</option>
								<option value="2">�ſ뱸��</option>
						</c:when>
						
						<c:otherwise>
								<option value="1" >���ݱ���</option>
								<option value="2" selected="selected">�ſ뱸��</option>
						</c:otherwise>
					</c:choose>	
			     </select>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">������ �̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName"  value="${ purchase.receiverName }" placeholder="������ �̸�">
		    </div>
		  </div>		
		  
		  <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">������ ��ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone"  value="${ purchase.receiverPhone }" placeholder="������ ��ȣ">
		    </div>
		  </div>	
		  
		  <div class="form-group">
		    <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">������ �ּ�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr"  value="${ purchase.divyAddr }" placeholder="������ �ּ�">
		    </div>
		  </div>	
		  
		  <div class="form-group">
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest"  value="${ purchase.divyRequest }" placeholder="���ſ�û����">
		    </div>
		  </div>	
		  
		  <div class="form-group">
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">����������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyDate" name="divyDate"  value="${ purchase.divyDate }" placeholder="����������">
		    </div>
		  </div>			  	  		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
		  	      
			  <a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
		    </div>
		  </div>
		</form>	    
	    
	</div>

</body>
</html>