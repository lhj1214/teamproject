	function inputChk(){
		var userid = document.getElementById("userid").value;
		var userpwd = document.getElementById("userpwd").value;
		if(userid == ""){
			document.getElementById("userid").focus()
			alert("아이디를 입력해주세요")	
		}else if(userpwd == ""){
			alert("비밀번호를 입력해주세요")
			document.getElementById("userpwd").focus()
		}else{
			var form = document.getElementById("login-form")
			form.submit();
		}
	}
	Kakao.init("e5a27f0557cdc4441fa727aba3bbeffd");//javascript 키값
	function loginWithKakao() {
	    Kakao.Auth.login({
	      success: function(authObj) {
	    	  console.log("success")
	    	  Kakao.API.request({//로그인 성공 시 사용자에 대한 정보 얻어오겠다
					url:'/v2/user/me',//카카오에 대한 경로이므로 그대로 사용
					success: function(res){//res로 결과값 받아옴						
						console.log('아이디 : '+res.id);
						console.log('이메일 : '+res.kaccount_email);
						console.log('닉네임 : '+res.properties['nickname']);
						console.log('토큰 값 : '+authObj.access_token);						
						var result = JSON.stringify(res);
						$.ajax({
							url : "success",//원하는 경로, location.href
							type : "post",//통신 방식
							contentType : 'application/json; charset=utf-8',
							data : result,
							success : function(cnt){//제대로 통신이 진행된 경우 return 값이 cnt로 들어옴
								console.log("ajax 성공")
								location.href=cnt;				
							},
							error : function(){//통신 실패했을 경우
								alert("문제가 발생했습니다.")
							}
						});//중괄호 안에 원하는 내용 작성
						alert('로그인 성공!')
					}, fail: function(err){
						alert(JSON.stringify(err))
					}
				})
	      },
	      fail: function(err) {
	        alert(JSON.stringify(err))
	      },
	    })
	  }
	function loginChk(login){
		var login = login;
		if(login!='null') {
			alert("현재 로그인 상태입니다.")
			history.back()
			};
	}