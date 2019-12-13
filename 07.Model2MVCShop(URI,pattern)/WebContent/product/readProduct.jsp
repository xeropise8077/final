<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>상품정보수정</title>

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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>

<script type="text/javascript">


function fncUpdateProduct(){
	//Form 유효성 검증
	
	
 	var name = $("input[name='prodName']").val();
	var detail = $("input[name='prodDetail']").val();
	var manuDate = $("input[name='manuDate']").val();
	var price = $("input[name='price']").val();
	
	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}
	//null이거나 글자가 1글자가 넘지 않는 경우
	if( $('#fileNameList').val() == null || $('#fileNameList').val().length< 1 ){
		var String = '${product.fileName}';
		$('#fileName').val( String );
	}

	$("form").attr("action","/product/updateProduct?menu=manage").attr("method","POST").attr("enctype","multipart/form-data").submit();
}
$(function(){
	$('button.btn.btn-primary').on("click",function(){
		fncUpdateProduct();
	});

	$("a[href='#']").on("click",function(){
		history.go(-1);
	});
});
</script>
</head>

<body>

	<!-- toolbar 시작  -->
	<jsp:include page="../layout/toolbar.jsp"></jsp:include>	
	<!-- toolbar 끝 -->
	

	<!-- 화면 구성 start -->
	<div class="container">
		
		<div class="page-header">
			<h3 class="text-info">상품정보수정</h3>
			 <h5 class="text-muted">상품 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
		
		</div>
		
		<!-- form start -->
		<form class="form-horizontal">
		
					<!-- hidden -->
			<input type="hidden" name="prodNo" value="${ product.prodNo }"/>
			<input type="hidden" id="fileName" name="fileName" value="">
			
			<div class="form-group">
				<label for="prodName" class="col-sm-offset1 col-sm-3 control-label">상 품 명</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="prodName" name="prodName" value="${ product.prodName }" placeholder="상품명" readonly>
					<span id="help-block" class="help-block">
						<strong class="text-danger">상품명은 수정불가</strong>
					</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="prodDetail" class="col-sm-offset1 col-sm-3 control-label">상품 상세 정보</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${ product.prodDetail }">
				</div>
			</div>
			
			<div class="form-group">
				<label for="manuDate" class="col-sm-offset1 col-sm-3 control-label">제조일자</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="manuDate" name="manuDate" value="${ product.manuDate }">
				</div>
			</div>
			
			<div class="form-group">
				<label for="price" class="col-sm-offset1 col-sm-3 control-label">가 격</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="price" name="price" value="${ product.price }">
				</div>
			</div>
			
			<!-- 이미지 -->
			<div class="form-group">
				<div class="col-sm-offset1 col-sm-3"></div>
				<div class="col-sm-4">	
					<c:forTokens items="${ product.fileName }" delims="@" var="fileName">
						<img src="../images/uploadFiles/${ fileName }" width="200" height="200" alt="My Image">
					</c:forTokens>
				</div>
			</div>
			
			<div class="form-group">
				<label for="price" class="col-sm-offset1 col-sm-3 control-label">이미지</label>
				<div class="col-sm-4">					
					<input type="file" class="form-control" id="fileNameList" name="fileNameList" value="" multiple="multiple">
				</div>
			</div>
			
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>			
		</form>
		<!-- form end -->
	</div>


</body>
</html>