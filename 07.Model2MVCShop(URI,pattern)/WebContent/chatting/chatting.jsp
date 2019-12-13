<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
<meta charset="utf-8">
<title>실시간 채팅</title>
 <link rel="stylesheet" type="text/css" href="../css/mystyle.css">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script>

function getChatting(){
	//$("section").empty();
	$.ajax(
			{
				url : "/chatting/json/getListChatting",
				method : "GET",
				dataType : "json",
				success : function(JSONData, status) {
					
					var list = JSONData.list;
					var text = "";
					$.each(list, function( index, value ){
						
						var newDiv = document.createElement("div");
						$(newDiv).text(value.userId+" : "+value.message+" ( "+value.date+" ) ");
						
						
						text += $(newDiv).text()+"<br>";
					});
					$("section").html(text);
					$('#section').scrollTop( $('#section')[0].scrollHeight )

					

				}
			}
		);
	
}

function addChatting(){
	
	if( $("textarea").text().length>0){
		$.ajax( 
			{	
				url : "/chatting/json/addChatting",
				method : "POST",
				contentType:"application/json; charset=UTF-8",
				data : JSON.stringify({ "userId":"${user.userId}","message":$("textarea").text()}),
				dataType : "json",
				success : function(JSONData , status) {
					
				}
				
			});
	
	$("textarea").empty();
	$('textarea').focus();
	}
}



	$( function(){
		$('textarea').focus();
		getChatting()
		setInterval(function() { getChatting()  }, 2000);
		
		//button click시
		$("input:button").on("click",function(){
			

			addChatting()

		});//end of click
		
	});//end of function()



</script>

<style>
section {
			overflow: scroll;
		 }

</style>
</head>
<body>
	<header>
		<h1>채팅 테스트</h1>
		
	</header>

	<section id="section">

	</section>

	<aside>
    
	</aside>

	<footer>
		<textarea>

		</textarea>
		<input type='button' value='입력'>
	</footer>
</body>
</html>
