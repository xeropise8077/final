<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>아이디 중복 확인</title>

<meta charset="EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style></style>



<script type="text/javascript">

	$(function(){
		
		$("input[name='userId']").focus();
		
		$("input[name='userId']").on('keydown',function(){
			if( event.KeyCode == '13'){
				
				if ( $("input[name='userId']").val() != null && $("input[name='userId']").length>0 ) {
					
					$("form").attr("action","/user/checkDuplication").attr("method","POST").submit();
				}else{
					alert('아이디는 반드시 입력하셔야 합니다.');
				}
				$("input[name='userId']").focus();
			}
		});
		
		$("button.btn.btn-info").on("click" , function() {
			
			// Form 유효성 검증
			if( $("#userId").val() != null && $("#userId").val().length >0) {
				$("form").attr("method" , "POST");
			    $("form").attr("action" , "/user/checkDuplication");
			    $("form").submit();
			}else {
				alert('아이디는 반드시 입력하셔야 합니다.');
			}
			$("#userId").focus();
		});
		
		//사용 버튼 클릭
		$("button.btn.btn-success").on("click" , function() {
			
			if(opener) {
				opener.$("input[name='userId']").val("${userId}");
				opener.$("input[name='password']").focus();
			}
			
			window.close();
		});
		
		//닫기 버튼 클릭
		$("button.btn.btn-primary").on("click" , function() {
			window.close();
		});
		
	});


</script>
</head>

<body>

	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		
		<br/><br/>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-inline">
		
		  <div class="form-group">
		    <label for="userId">아 이 디</label>
		    <input type="text" class="form-control" name="userId" id="userId"  placeholder="아이디"
		    																		value="${ ! empty result && result ? userId : '' }" >
		  </div>
		  <button type="button" class="btn btn-info">중복확인</button>
		  
		  <c:if test="${ ! empty result }">
		  	<c:if test="${ result =='true' }">
		  		<button type="button" class="btn btn-success">사 용</button>
		  	</c:if>
		  </c:if>
		  
		  <button type="button" class="btn btn-primary">닫 기</button>
		  
		  <c:if test="${ empty result }">
		  	<span class="text-info glyphicon glyphicon-ok">입력후중복확인</span>
		  </c:if>
		  
		  <c:if test="${ ! empty result }">
		  	<c:if test="${ result =='true' }">
				<span class="text-success glyphicon glyphicon-ok">사용가능 &nbsp;</span>
			</c:if>
			<c:if test="${ result=='false' }">
		 		<span class="text-danger glyphicon glyphicon-remove">사용불가능</span>
			</c:if>
		  </c:if>
		 
		</form>
		<!-- form Start /////////////////////////////////////-->
	
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->

</body>
</html>