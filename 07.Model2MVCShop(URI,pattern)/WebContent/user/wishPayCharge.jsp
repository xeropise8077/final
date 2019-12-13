<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
<title>ȸ������</title>

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

	<style>
 		body {
            padding-top : 50px;
        }
     </style>
     
     	
<script type="text/javascript">

$( function(){
	
	$("button").on('click',function(){
		$("form").attr("method","POST").attr("action","/user/chargeWishPay?userId=${user.userId}").submit();
	});
	
	$("a[href='#']").on("click",function(){
		
		self.location = "../main.jsp";
	});
});


</script>
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<br><br><br><br>
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">������������</h3>
	       <h5 class="text-muted">���� �����Ͻø�<strong class="text-danger">2% �߰� ����</strong>�ص帳�ϴ�.</h5>
	    </div>
	
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="wishPay" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="wishPay" name="wishPay" value="">
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">����Ʈ���� ���� ��ȯ�� �Ұ��մϴ�.</strong>
		      </span>
		    </div>
		  </div>
		 
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >��&nbsp;��</button>
		  	      
			  <a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
		    </div>
		  </div>
		  		
		</form>
	
	</div>

</body>
</html>