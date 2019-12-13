<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>��ǰ ��� ��ȸ</title>

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
	
	<script type="text/javascript">
	



	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("action","/product/listProductVanila?menu=search" ).attr("method","POST").submit();
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
		
		$('button.btn.btn-default').on("click",function(){
			fncGetUserList('1');
		});
		
		//��ǰ ���� Ȯ��
		$("button").on("click", function(){	
			self.location ="/product/getProduct?prodNo="+$(this).next().val().trim()+"&menu=search";	
		});
		
		// ��ǰ ����
		$("a[href='#']").on("click", function(){
			self.location ="/purchase/addPurchaseView?prodNo="+$(this).prev().val().trim();
		});
		
		// ���� ��ũ��
		var number = 2;
		
		
	    if ($(window).scrollTop() != null) {
	    	
		    	$.ajax(
		    		{
		    			url: "/product/json/getProductListVanila",
		    			method : "POST",
		    			data : JSON.stringify({
		    					currentPage : number,
		    					pageSize : 3
		    			}),
		    			contentType : "application/json; charset=UTF-8",
		    			dataType : "json",
		    			success : function(JSONData, status) {
		    				
		    				for(i=0; i<JSONData.list.length; i++){
		    					
		    					console.log(JSONData.list[i])
		    					
		    					var string="<div class='col-sm-6 col-md-4'>"
		    								+"<div class='thumbnail'>"		    				    				
		    										+"<img src='../images/uploadFiles/"+JSONData.list[i].fileName.split('@')[0]+"' style='width : 150px; height:150px ;' alt='My Image'>"
		    				      				+"<div class='caption text-center'>"
		    				        				+"<h3>��ǰ��</h3>"
		    				        				+"<p>"+JSONData.list[i].prodName+"</p>"	
		    				        				+"<h3>�� ��</h3>"
		    				        				+"<p>"+JSONData.list[i].price+"</p>"					            	        
		    				        	    	+"<p><button class='btn btn-primary'>������</button>"
		    				           			+"<input type='hidden' value='"+JSONData.list[i].prodNo+"'>"
		    				        			+"<a href='#' class='btn btn-default' role='button'>��ñ���</a></p>"
		    				      					+"</div>"
		    				      				+"</div>"
		    				      			+"</div>"
		    				      			
		    				     $("div.container").last().append(string).css({'display': 'block', 'opacity': 0}).animate({'opacity': 1}, 300);
		    				}
		    			}
		    			
		    		})
				number++;		    	
	     			 
	    } 
		
		
			$(window).scroll(function() {
			
			
			    if ( $(window).scrollTop() == ( $(document).height() - $(window).height() ) ) {
		    		
			    	$.ajax(
			       	  		{
		       	  			url : "/product/json/getProductListVanila",
		       	  			method : "POST",
		       	  			data : JSON.stringify({
		       	  					currentPage : number,
		       	  					pageSize : 3
		       	  				}),
		       	  			contentType:'application/json; charset=utf-8',
		       	  			dataType : "json",
		       	  			success : function(JSONData, status) {
								
		       	  				//var array = JSONData.list[1].fileName.split('@');
		       	  				
		       	  				for(i=0; i<JSONData.list.length; i++){	
		    						var string="<div class='col-sm-6 col-md-4'>"
    									+"<div class='thumbnail'>"
    										for(j=0; j<JSONData.list[i].fileName.split('@').length; j++){
    											if( JSONData.list[i].fileName.split('@')[j] != null && JSONData.list[i].fileName.split('@')[j].length>1 ){
    										string+="<img src='../images/uploadFiles/"+JSONData.list[i].fileName.split('@')[j]+"' style='width : 150px; height:150px ;' alt='My Image'>"
    											}
    										}
    				      				string+="<div class='caption text-center'>"
    				        				+"<h3>��ǰ��</h3>"
    				        				+"<p>"+JSONData.list[i].prodName+"</p>"	
    				        				+"<h3>�� ��</h3>"
    				        				+"<p>"+JSONData.list[i].price+"</p>"					            	        
    				        	    	+"<p><button class='btn btn-primary'>������</button>"
    				           			+"<input type='hidden' value='"+JSONData.list[i].prodNo+"'>"
    				        			+"<a href='#' class='btn btn-default' role='button'>��ñ���</a></p>"
    				      					+"</div>"
    				      				+"</div>"
    				      			+"</div>"
    				      			$("div.container").last()
    				  		   //$("div.container").last().append(string);
    				  		   $(string).hide().appendTo($("div.container").last()).fadeIn(1000);
    				      			
		       	  			}
		       	  				
		       	  			}
		     			 })//end of ajax
		     			 
		     			 number++;
		    			}// end of if
		    
		    		})//end of scroll
     });
	
</script>

<style>
#thumbNail {
	display : inline;
}

</style>
</head>

<body>
	<!-- toolbar start -->
	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	<!-- toolbar end -->
	

	<!-- ȭ�鱸�� Start -->
	
	<div class="container">
		
		<div class="page-header text-info">
			<h3>��ǰ ��� ��ȸ</h3>
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
		   
			<c:forEach var="i" items="${ list }" begin="0">
				<c:set var="Product" value="${ i }" />		

				  <div class="col-sm-6 col-md-4">
				    <div class="thumbnail">												<!-- �Ϻη� �ϳ��� ������ ó���� ���� -->
						<c:forTokens items="${ Product.fileName }" delims="@" var="fileName" begin="0" end="0">
							<img src="../images/uploadFiles/${ fileName }" style="width : 150px; height:150px ;" alt="My Image">
						</c:forTokens>
				      <div class="caption text-center">
				        <h3>��ǰ��</h3>
				        <p>${ Product.prodName }</p>	
				        <h3>�� ��</h3>
				        <p>${ Product.price }</p>					        
				        	        	        
				        <p><button class="btn btn-primary">������</button>
				           <input type="hidden" value="${ Product.prodNo }">
				        <a href="#" class="btn btn-default" role="button">��ñ���</a></p>
				      </div>
				    </div>
				  </div>
	
			</c:forEach>
	</div>
	



</body>
</html>