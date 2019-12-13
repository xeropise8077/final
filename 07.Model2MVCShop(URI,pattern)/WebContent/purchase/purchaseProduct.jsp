<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>






<html>
<head>

<style>
.container {
	height : auto;
	border-style : double;
	border-width : 3px;	
}

body {
    padding-top : 100px;
}

</style>

<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<!-- jQuery DatePicker �߰� --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  

<title>Insert title here</title>

   	<!--  ///////////////////////// CSS ////////////////////////// -->


	<style>
 		body {
            padding-top : 100px;
        }
     </style>

<script type="text/javascript">


function changeStatus() {
	var a = '${ product.price }';
	var c = parseInt( $("input[name='count']").val() );
	$("#price").text( a*c );
	
	return $("#price").text();
}

function fncAddPurchase() {
	
	var a = parseInt( $("input[name='money']").val() );
	var b = parseInt( $("input[name='wishPay']").val() );
	var c = parseInt( $("input[name='count']").val() );
	
	var payment = (a+b)*c;
	// ������ �°� �� ���� ���ؾ��ϴµ� ������ ����.
	var productPrice = changeStatus();
	
	if(productPrice==payment){
		
		$("form").attr("method","POST").attr("action","/purchase/addPurchase?prodNo=${ product.prodNo}").submit();
		}else if(productPrice<payment){
		
		alert('�ݾ� '+productPrice+' ���� ���ݰ� ĳ���� �ʰ� ����ϼ̽��ϴ�.')
		$("input[name='money']").focus();
	}else{
		alert('�ݾ� '+productPrice+' �� �°� ������ּ���.\n���ݰ� ĳ���� ������ּ���.')
	}
}

$( function(){
	
	$("input[name='count']").change( function(){
		changeStatus();
	});
	
	$('button.btn.btn-primary').on("click",function(){
		fncAddPurchase();
	
	});
	
	$("a[href='#']").on("click",function(){
		history.go(-1);
	
		

	});
	//�޷� �߰�
	$( "#divyDate" ).datepicker({
		  dateFormat: "yy-mm-dd",
	      changeMonth: true,
	      changeYear: true,
	      gotoCurrent: true,
	      showOn: "button",
	      buttonImage: "../images/calendar/calendar-icon.png",
	      buttonImageOnly: true,
	      buttonText: "Select date"		      
	    });
});


</script>
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	

	
	<div class="container">
		<form class="form-horizontal">	
		<div class="row form-group">
	  		<div class="col-sm-offset-1 col-sm-3 text-right"><strong>��ǰ��ȣ</strong></div>
			<div class="col-sm-4">${ product.prodNo }</div>
		</div>
		
		<div class="row form-group">
	  		<div class="col-sm-offset-1 col-sm-3 text-right"><strong>��ǰ��</strong></div>
			<div class="col-sm-4">${ product.prodName }</div>
		</div>
		
		<div class="row form-group">
	  		<div class="col-sm-offset-1 col-sm-3 text-right"><strong>��ǰ������</strong></div>
			<div class="col-sm-4">${ product.prodDetail }</div>
		</div>			
		
		<div class="row form-group">
	  		<div class="col-sm-offset-1 col-sm-3 text-right"><strong>��������</strong></div>
			<div class="col-sm-4">${ product.manuDate }</div>
		</div>	
	
	

			
		<div class="row form-group">
	  		<div class="col-sm-offset-1 col-sm-3 text-right"><strong>����</strong></div>
			<div class="col-sm-4" id="price" >${ product.price }</div>
		</div>
	
	
		<!-- hidden -->
		<input type="hidden" name="price" value="${ product.price }" />
		<input type="hidden" name="buyerId" value="${ requestScope.user.userId }" />
		
		<div class="row form-group">
			<label for="money" class="col-sm-offset-1 col-sm-3 control-label">�� ��</label>
			<div class="col-sm-4">
			<input type="number" class="form-control" id="money" name="money" min="0" max="${product.price}" value="0">
			</div>
		</div>
		
		<div class="row form-group">
			<label for="wishPay" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
			<div class="col-sm-4">
			<input type="number" class="form-control" id="wishPay" name="wishPay" min="0" max="${ product.price}" value="${ product.price}">
			</div>
		</div>
		
		<div class="row form-group">
			<label for="count" class="col-sm-offset-1 col-sm-3 control-label">�� ��</label>
			<div class="col-sm-4">
			<input type="number" class="form-control" id="count" name="count" min="0" max="${ product.stockCount}" value="1">	
			</div>
		</div>									
		
	 	
	 	<div class="row form-group">
	  		<div class="col-sm-offset-1 col-sm-3 text-right"><strong>�������</strong></div>
			<div class="col-sm-4">${ product.regDate }</div>	 		
	 	</div>			

	 	<div class="row form-group">
	 		<!-- ���� �߿��ѵ�.. �̷����ϸ� ���� ����; -->
	  		<label for="buyer.userId" class="col-sm-offset-1 col-sm-3 control-label">������ ���̵�</label>
	 		<div class="col-sm-4">
	 			<input type="text" class="form-control" name="buyer.userId" id="buyer.userId" value="${ user.userId }">
	 		</div> 		
	 	</div>	
	 	
	 	<div class="row form-group">
			<label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
			<div class="col-sm-4">
				<select class="form-control" id="paymentOption" name="paymentOption">
					<option value="1" selected>���ݱ���</option>
					<option value="2">�ſ뱸��</option>
				</select>	
			</div>	 		
	 	</div>	
	 	
	 	<div class="row form-group">
	 		<label for="receiverName" class="col-sm-offset1 col-sm-4 control-label">�������̸�</label>
	 		<div class="col-sm-3">
	 			<input type="text" class="form-control" name="receiverName" id="recieverName" value="${ user.userName }">
	 		</div>
	 	</div>	
	 	
	 	<div class="row form-group">
	 		<label for="receiverPhone" class="col-sm-offset1 col-sm-4 control-label">�����ڿ���ó</label>
	 		<div class="col-sm-3">
	 			<input type="text" class="form-control" name="receiverPhone" id="receiverPhone" value="${user.phone}">
	 		</div>
	 	</div>
	 	
	 	<div class="row form-group">
	 		<label for="divyAddr" class="col-sm-offset1 col-sm-4 control-label">������ �ּ�</label>
	 		<div class="col-sm-3">
	 			<input type="text" class="form-control" name="divyAddr" id="divyAddr" value="${ user.addr }">
	 		</div>
	 	</div>	
	 	
	 	<div class="row form-group">
	 		<label for="divyRequest" class="col-sm-offset1 col-sm-4 control-label">������ ��û����</label>
	 		<div class="col-sm-3">
	 			<input type="text" class="form-control" name="divyRequest" id="divyRequest" value="">
	 		</div>
	 	</div>	 	
	 	
	 	<div class="row form-group">
	 		<label for="divyDate" class="col-sm-offset1 col-sm-4 control-label">�����۳�¥</label>
	 		<div class="col-sm-3">
	 			<input type="text" class="form-control" name="divyDate" id="divyDate" value="">
	 		</div>
	 	</div>		 	
	 	
		  <div class="row form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		  	</form>	 		
		</div>	 	

</body>
</html>