<%@ page contentType="text/html; charset=euc-kr" %>



<html lang="ko">
<head>
<title>로그인 화면</title>

<!-- 네이버 로그인 --> 
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

<!-- 카카오 로그인 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- 구글 로그인 -->
<meta name="google-signin-client_id" content="425119655363-77qb1v2jk5o45dlc9di7sej1rvusi0ak.apps.googleusercontent.com">
    <!-- 인증과 관련된 정보 처리  -->
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	
<!-- bootStrap 관련 설정 -->
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<!-- /////////////////////////////////////////////////////////////////////////// -->
	<style>
    	 body >  div.container{ 
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>

<script type="text/javascript">


$( function(){
	function fncLogin() {
		var id= $("input[name='userId']").val();
		var pw= $("input[name='password']").val();
		

		if(id == null || id.length <1) {
			alert('ID 를 입력하지 않으셨습니다.');
			$("input[name='userId']").focus();
			return;
		}
		
		if(pw == null || pw.length <1) {
			alert('패스워드를 입력하지 않으셨습니다.');
			$("input[name='password']").focus();
			return;
		}
		$("form").attr("method","POST").attr("action","/user/login").submit();
	}
	
	//Call Back Method 이용 onload 시 Event 처리
	
	 	$("#userId").focus();
	 	
		$("button").on("click",function(){
             fncLogin();
        });
        
		//============= 회원원가입화면이동 =============
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#' ]").on("click" , function() {
				self.location = "/user/addUser"
			});
	 	
	});
</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Wish List</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->	
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
		<div class="row">
		
			<div class="col-md-6">
					<img src="/images/logo-spring.png" class="img-rounded" width="100%" />
			</div>
	   	 	
	 	 	<div class="col-md-6">
	 	 	
		 	 	<br/><br/>
				
				<div class="jumbotron">	 	 	
		 	 		<h1 class="text-center">로 &nbsp;&nbsp;그 &nbsp;&nbsp;인</h1>
					<!-- form -->
			        <form class="form-horizontal">
		  
					  <div class="form-group">
					    <label for="userId" class="col-sm-4 control-label">아 이 디</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" name="userId" id="userId"  placeholder="아이디" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="password" class="col-sm-4 control-label">패 스 워 드</label>
					    <div class="col-sm-6">
					      <input type="password" class="form-control" name="password" id="password" placeholder="패스워드" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					      <button type="button" class="btn btn-primary"  >로 &nbsp;그 &nbsp;인</button>
					      <a class="btn btn-primary btn" href="#" role="button">회 &nbsp;원 &nbsp;가 &nbsp;입</a>
					    </div>
					  </div>
			
					</form>
			   	 </div>
			
			</div>
			
  	 	</div>
  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	</div>
 	<!--  화면구성 div end /////////////////////////////////////-->

     <!-- 네이버아이디로로그인 버튼 노출 영역 -->
 	 <div id="naver_id_login"></div>
	   <!-- //네이버아이디로로그인 버튼 노출 영역 -->
	  <script type="text/javascript">
	  	var naver_id_login = new naver_id_login("JyW1rQZ3uiU4P9qsEgfY", "http://192.168.0.78:8080/user/callback.jsp");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("green", 3,35);
	  	naver_id_login.setDomain("http://192.168.0.78:8080/user/loginView.jsp");
	  	naver_id_login.setState(state);
	  	//naver_id_login.setPopup();	
	  	naver_id_login.init_naver_id_login();
	  </script>
	  
	  <!-- 카카오 아이디로 로그인 -->
        <a id="custom-login-btn" href="javascript:loginWithKakao()" target="rightFrame">
        <img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
        </a>
        <script type='text/javascript'>
          //<![CDATA[
            // 사용할 앱의 JavaScript 키를 설정해 주세요.
            Kakao.init('e195c747986bcc9e0da58dd2ded5409c');
            function loginWithKakao() {
              // 로그인 창을 띄웁니다.
              Kakao.Auth.login({
                success: function(authObj) {
                    if( authObj.access_token != null){
               	     // 로그인 성공시, API를 호출합니다.
               	     Kakao.API.request({
               	      url: '/v1/user/me',
               	      success: function(res) {
               	  			$.ajax(
               	  				{
               	  					url : "/user/json/addUser",
               	  					method : "POST",
               	  					data : JSON.stringify({
               	  							userId : res.kaccount_email.split("@")[0]+"1",
               	  							userName :	 res.properties.nickname,
               	  							password : res.id
               	  						}),
               	  					contentType:'application/json; charset=utf-8',
               	  					dataType : "json",
               	  					success : function(serverData, status) {
											
               	  					}
               	  			
               	  				});
							self.location="../main.jsp";
               	   	   },
               	     })
                  }
                },
                fail: function(err) {
                  alert(JSON.stringify(err));
                }
              });
            };
    </script>	
	 
	<!-- 구글 로그인 -->  
    <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
	<script>
    function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
      
        
		$.ajax(
 	  				{
 	  					url : "/user/json/addUser",
 	  					method : "POST",
 	  					data : JSON.stringify({
 	  							userId : profile.getEmail().split("@")[0]+"2",
 	  							userName :	 profile.getName(),
 	  							password : profile.getId().substr(0, 7),
 	  						}),
 	  					contentType:'application/json; charset=utf-8',
 	  					dataType : "json",
 	  					success : function(serverData, status) {
 	  						
 	  						
 	  					}
 	  			
 	  				});
		self.location="../main.jsp";
      }
    </script>


</body>
</html>