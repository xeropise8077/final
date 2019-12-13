<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<title>�Ǹŵ� ��ǰ ��� ��ȸ</title>

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

<script type="text/javascript">
	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("action","/product/listProduct?menu=manage" ).attr("method","POST").submit();
	}
	
	function enterkey(){
		if (event.keyCode == 13) {
			 
            // ����Ű�� ������ �� ������ ����
			fncGetUserList('1');
       }
	}


$(function(){
	$("td:nth-child(2)").css('color','red');
	$("td:nth-child(2)").css('text-decoration','underline');
	///*

	
	
	$('button.btn.btn-default').on("click",function(){
		fncGetUserList('1');
	});
	
	$("td:nth-child(2)").on("click", function(){	
		self.location ="/product/getProduct?prodNo="+$(this).prev().text().trim()+"&menu=manage";	
	});
	
	
});
	
	
</script>

</head>

<body>
	<!-- toolbar start -->
	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	<!-- toolbar end -->

	<!-- ȭ�鱸�� Start -->
	
	<div class="container">
		
		<div class="page-header text-info">
			<h3>�Ǹ� ��� ��ȸ</h3>
		</div>
		
		
		<div class="row">
			
			<div class="col-md-6 text-left">
				<p class="text-primary">
					��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
				</p>
			</div>
			
			<div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm">
					<div class="form-group">
						<select class="form-control" name="searchCondition">
							<option value="0"
								${ search.searchCondition=="0" ? 'selected' : '' }>��ǰ��ȣ</option>
							<option value="1"
								${ search.searchCondition=="1" ? 'selected' : '' }>��ǰ��</option>
							<option value="2"
								${ search.searchCondition=="2" ? 'selected' : '' }>����</option>						
						</select>
					</div>
					
					<div class="form-group">
						<label class="sr-only" for="searchKeyword">�˻���</label>
						<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="�˻���"
							value="${ search.searchKeyword }" onkeydown="enterkey()">
					</div>
					
					 <button type="button" class="btn btn-default">�˻�</button>

			
					 
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>					 
				</form>
			</div>
		</div>
		<!-- row end -->
		
		<!-- table start -->
		<table class="table table-hover table-striped">
			<thead>
				<tr>
            <th align="center">��ǰ��ȣ</th>
            <th align="left" >��ǰ��</th>
            <th align="left">����</th>
            <th align="left">�����</th>
            <th align="left">�������</th>
            <th align="left">����</th>				
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="i" items="${ list }" begin="0">
					<c:set var="ProductPurchase" value="${ i }" />
						<tr>
						  <td align="center">${ ProductPurchase.prodNo }</td>
						  <td align="left"  title="Click : ��ǰ���� Ȯ��">${ProductPurchase.prodName}</td>
						  <td align="left">${ProductPurchase.price}</td>
						  <td align="left">${ProductPurchase.regDate}</td>
						  <td align="left">
						  	<c:if test="${ProductPurchase.tranCode.trim()=='1'}">
						  		���ſϷ�
						  		<c:if test="${ user.role=='admin'}">
									<a href="/purchase/updateTranCode?tranNo=${ ProductPurchase.tranNo }&trancode=${ ProductPurchase.tranCode.trim() }&menu=product" target="rightFrame">(����ϱ�)</a>
								</c:if>	
						  	</c:if>
						  	
						  	<c:if test="${ProductPurchase.tranCode.trim()=='2'}">
						  		�����
						  	</c:if> 
						  	
						  	<c:if test="${ProductPurchase.tranCode.trim()=='3'}">
						  		��ۿϷ�!
						  	</c:if>
						  </td>
						  <td align="center">
						  	<c:forTokens items="${ ProductPurchase.fileName }" delims="@" var="fileName">
								<img src="../images/uploadFiles/${ fileName }" width="200" height="200" alt="My Image">
							</c:forTokens>
						  </td>
						</tr>					
								
				</c:forEach>
			</tbody>
		</table>
		
	</div>
	
	<jsp:include page="../common/pageNavigator_new.jsp" />
	


</body>
</html>