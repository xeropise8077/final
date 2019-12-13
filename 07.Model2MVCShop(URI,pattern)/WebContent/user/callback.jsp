<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("JyW1rQZ3uiU4P9qsEgfY", "http://192.168.0.78:8080/user/callback.jsp");

  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    
	$.ajax(
   	  		{
   	  			url : "/user/json/addUser",
   	  			method : "POST",
   	  			data : JSON.stringify({
   	  					userId : naver_id_login.getProfileData('email').split("@")[0],
   	  					password : naver_id_login.getProfileData('id')
   	  				}),
   	  			contentType:'application/json; charset=utf-8',
   	  			dataType : "json",
   	  			success : function(serverData, status) {

   	  			}
 	 })
 	 
 	 self.location="../main.jsp";

  }
</script>
</body>
</html>