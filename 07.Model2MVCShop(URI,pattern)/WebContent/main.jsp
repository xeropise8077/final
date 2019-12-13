<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<!-- <meta charset="EUC-KR"> -->
	<meta charset="euc-kr">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS �߰� : ���ٿ� ȭ�� ������ ���� �ذ� :  �ּ�ó�� ��, �� Ȯ��-->
	<style>
        body {
            padding-top : 70px;
        }
        

   	</style>
   	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	 	
	
</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  �Ʒ��� ������ http://getbootstrap.com/getting-started/  ���� -->	
   	<div class="container">
      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Wish List</h1>
        <p>��</p>
     </div>
    </div>

	<!-- ���� : http://getbootstrap.com/css/   : container part..... -->
	<div class="container">
        <!-- <h3 class="text-center">�Ҿ��� ������ �������̴�.</h3>  -->
        	<!-- ȯ�� ���� �������� -->
        	<script>
        	$( function(){
        		
        		$.ajax({
        			url: "/etc/json/getCurrency",
        			method : "GET",
        			contentType: 'application/x-www-form-urlencoded; charset=euc-kr',
        			success : function(JSONData, status){
        				$("div.container").last().prev().append(JSONData).css({'display': 'block', 'opacity': 0}).animate({'opacity': 1}, 300);
        				$("div.container").last().prev().append("<div align='center'><em>�� ũ�Ѹ�(Jsoup)���� ȯ�� ���� ��������</em></div>");
        				$("a[nocr]").removeAttr('onclick');
        				$("a[nocr]").removeAttr('href');
        				//$("a").removeAttr('nocr');
        				$("a[nocr]").on("click",function(){
        					window.open("https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&mra=bk01&query="+$(this).children().first().text(), "currency", "width = 500, height = 500, top = 100, left = 200, location = no, resizable=yes, scrollbars=yes");
        				});
        			}
        			
        		});//end of ajax
        	});
        	
        	</script>
	        
	        
	
   	 </div>
   	 
   	 <div class="container">
        	<script>
        	$( function(){
        		
        		$.ajax({
        			url: "/etc/json/getKeyword",
        			method : "GET",
        			contentType: 'application/x-www-form-urlencoded; charset=euc-kr',
        			success : function(JSONData, status){
        				
        				$("div.container").last().append(JSONData).css({'display': 'block', 'opacity': 0}).animate({'opacity': 1}, 300);
        				
        				// html �±� ���α�
        				$('.item_title').wrap('<a abcd />');

        				
        				$("div.container").last().append("<div align='center'><em>�� ũ�Ѹ�(Selenium)���� �ǽð� �˻� ���� ��������</em></div>");       				
        				
        				
						$('.item_box').wrap("<table class=\"table\" />");
        				
						$('.item_num').unwrap();
						$('.table').unwrap();
						$('.table').unwrap();
						//$('.table').unwrap();
						
						$(".item_num").each(function(index, item){ 
							
							  var text = $(item).text().trim();
							  console.log( text );
							  $(item).replaceWith("<tr><th id='special'>"+text+"</th>");
							  
						})

						
						$('a[abcd]').unwrap();
						$('.item_title_sub').remove();
						
						$(".item_title").each(function(index, item){
							
							var text = $(item).text().trim();
							console.log( text );
							$(item).replaceWith("<td id='special2'><a xero>"+text+"</a></td></tr>");
						})
						
						$('th#special').unwrap();
						
						var html = "<table class='table'>"+$('.ranking_box').html()+"</table>";
						
						$('.ranking_box').html(html);
						
        				$("a[xero]").on("click",function(){
        					
        					window.open("https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&mra=bk01&query="+$(this).text(), "keyWord", "width = 500, height = 500, top = 100, left = 200, location = no, resizable=yes");
        				}); 



        				
        			}
        		});
        	});
        	
        	
        	</script>
   	 </div>

        
</body>

</html>