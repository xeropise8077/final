<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>���� ��� ��ȸ</title>

<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<script type="text/javascript">
	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage);
		$("form").attr("method","POST").attr("action","/purchase/listPurchase").submit();
	}
	
	$(function(){
		$("td:nth-child(2)").css("text-decoration","underline").css("color","red");

		
		$("td:nth-child(2)").on("click",function(){
			self.location="/purchase/getPurchase?tranNo="+$(this).prev().text().trim();
		
		});
		
		//������
		$("td:nth-last-child(1)").on("click",function(){
		   
			self.location="/payment/getPayment?tranNo="+$(this).siblings().first().text().trim();
		});
		
		//���� ����
		$("td:nth-last-child(2)").on("click",function(){
			var tranNo=$(this).siblings().first().text().trim();
			
	
			
			$.ajax( 
					{
						url : "/purchase/json/getPurchase/"+tranNo,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {
								
							var displayValue = "<h6>"
														+"���Ź�ȣ : "+JSONData.tranNo+"<br/>"
														+"��ǰ��ȣ : "+JSONData.purchaseProd.prodNo+"<br/>"
														+"������ ���̵� : "+JSONData.buyer.userId+"<br/>"
														+"������ ���� : "+JSONData.receiverName+"<br/>"
														+"��� ��¥ : "+JSONData.divyDate+"<br/>"
														+"</h6>";
							$("h6").remove();
							$( "#"+tranNo+"" ).html(displayValue);
						}
				});
			
			
			
		});
		
	});
</script>

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>���Ÿ����ȸ</h3>
	    </div>

	
	
    <!-- table ���� �˻� Start /////////////////////////////////////-->
    <div class="row">
    
	    <div class="col-md-6 text-left">
	    	<p class="text-primary">
	    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
	    	</p>
	    </div>	
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>���Ź�ȣ</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>������ �̸�</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  onkeydown="enterkey()">
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	</div>
					
     <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >ȸ�� ID</th>
            <th align="left">�������̸�</th>
            <th align="left">�����ڹ�ȣ</th>
            <th align="left">�����Ȳ</th>
            <th align="left">��������</th>
            <th align="left">��������</th>
            <th align="left">��������</th>
          </tr>
        </thead>
      
      	<tbody>
		  <c:forEach var="i" items="${list}">
			<c:set var="purchase" value="${ i }" />
			<tr>
			  <td align="left">${ purchase.tranNo }</td>
			  <td align="left"  title="Click : �������� Ȯ��">${ purchase.buyer.userId}</td>
			  <td align="left">${ purchase.receiverName }</td>
			  <td align="left">${ purchase.receiverPhone }</td>
			  <td align="left">
			  		<c:choose>
			  			<c:when test="${ purchase.getTranCode().trim().equals('3') }">
			  				��� �Ϸ� ���� �Դϴ�.
			  			</c:when>
			  			
						<c:when test="${purchase.getTranCode().trim().equals('2') }">
							����� �����Դϴ�
						</c:when>							
						
						<c:when test="${purchase.getTranCode().trim().equals('1') }">
							���ſϷ�����Դϴ�. 
						</c:when>				  			
			  		</c:choose>
			  </td>
			  <td align="left">
				<c:if test="${purchase.getTranCode().trim().equals('2')}">
					<a href="/purchase/updateTranCode?tranNo=${ purchase.tranNo }">���ǵ���</a>
				</c:if>
			  </td>
			  <td align="left">
			  	   <span id="${ purchase.tranNo }" class="glyphicon glyphicon-list" aria-hidden="true"></span>
			  </td>
			  <td align="left">
			  	<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
			  </td>
			  
			</tr>
          </c:forEach>
        
        </tbody>
        
        </table>
        <!-- table end ////////////////////////////////////// -->

	</div>
	
	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... --> 	


</body>
</html>