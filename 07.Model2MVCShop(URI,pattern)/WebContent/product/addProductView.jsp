<%@ page contentType="text/html; charset=euc-kr"%>

<html>
<head>
<title>상품등록</title>

<style>
#won {
	padding-top : 7px;
	padding-left : 1px;
}

#calendar {
	padding-top : 8px;
	padding-left : 1px;
}


</style>



<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<!-- jQuery DatePicker 추가 --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 



<script type="text/javascript">
$(function(){
	function fncAddProduct() {
		var name = $("input[name='prodName']").val();
		var detail = $("input[name='prodDetail']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price = $("input[name='price']").val();
		
		if (name == null || name.length<1 ){
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if (detail == null || detail.length < 1) {
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		if (manuDate == null || manuDate.length < 1) {
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if (price == null || price.length < 1) {
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}
		
		$("form").attr("action","/product/addProduct").attr("method","POST").attr("enctype","multipart/form-data").submit();
	}
	
	function resetData() {
		history.go(-1);
	}
	
	//달력 추가

		$( "#manuDate" ).datepicker({
			  dateFormat: "yy-mm-dd",
		      changeMonth: true,
		      changeYear: true,
		      gotoCurrent: true,
		      showOn: "button",
		      buttonImage: "../images/calendar/calendar-icon.png",
		      buttonImageOnly: true,
		      buttonText: "Select date"		      
		    });
	
	//등록 버튼
	$('button.btn.btn-primary').on('click',function(){
		fncAddProduct();
		
	});
	
	//취소 버튼
	$("a[href='#']").on('click',function(){
		resetData();
		
	});
});
</script>
</head>

<body>

	<div class="navbar navbar-default">
		<div class="container">
			<a class="navbar-brand" href="/user/index">Model2 MVC Shop</a>
		
		</div>
	
	</div>
	
	
	<div class="container">
		<h1 class="bg-primary text-center">상품 등록</h1>
		
		<form class="form-horizontal">
			<div class="form-group">
				<label for="prodName" class="col-sm-offset1 col-sm-3 control-label">상 품 명</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="prodName" name="prodName" placeholder="기능확인중"> 
				</div>
				<div class="col-sm-3">
				</div>
			</div>
		
			<div class="form-group">
				<label for="prodDetail" class="col-sm-offset1 col-sm-3 control-label">상품 상세정보</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="카테고리를 적어..">
				</div>
				<div class="col-sm-3">
				</div>
			</div>
			
			<div class="form-group">
				<label for="manuDate" class="col-sm-offset1 col-sm-3 control-label">제조일자</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="manuDate" name="manuDate">
					
				</div>
				<div class="col-sm-3" id="calendar">
				</div>
			</div>
			
			<div class="form-group">
				<label for="price" class="col-sm-offset1 col-sm-3 control-label">가격</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="price" name="price">
				</div>
				<div class="col-sm-3 text-left" id="won">원
				</div>			
			</div>
			
			<div class="form-group">
				<label for="fileNameList" class="col-sm-offset1 col-sm-3 control-label">상품이미지</label>
				<div class="col-sm-4">
					<input type="file" class="form-control" id="fileNameList" name="fileNameList" multiple="multiple">
					
				</div>	
				<div class="col-sm-3">
				</div>
			</div>
			
			<div class="form-group">
				<label for="stockCount" class="col-sm-offset1 col-sm-3 control-label">재고숫자</label>
				<div class="col-sm-4">
					<input type="number" class="form-control" id="stockCount" name="stockCount" min="1" max="999">
				</div>
				<div class="col-sm-3">
				</div>
			</div>
			
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >등 록</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 소</a>
		    </div>
		  </div>			
		</form>
	</div>

	
</body>
</html>