$(document).ready(function(){	
	
	$('#register-form').submit(function(){
		
		if(('#mem_passwd').val()==''){
			alert('비밀번호를 입력하세요');
			$('#mem_passwd').focus();
			return false;
		}
		
		if(('#mem_name').val()==''){
			alert('이름을 입력하세요');
			$('#mem_name').focus();
			return false;
		}
		
		if(('#mem_cell').val()==''){
			alert('이름을 입력하세요');
			$('#mem_cell').focus();
			return false;
		}
		
		if(('#mem_email').val()==''){
			alert('이름을 입력하세요');
			$('#mem_email').focus();
			return false;
		}
		
	});
});
