/*==================================관리자 희망 도서==================================*/
//관리자 희망도서 진행상태 변경
$(".status").change(function(){
	//alert($(this).attr('data-num')+', ' +$(this).find('option:selected').val());
	var wish_num=$(this).attr('data-num');
	var wish_status=$(this).find('option:selected').val();
	$('.status_button').click(function(){
		location.href="updateStatus.do?wish_num="+wish_num+"&wish_status="+wish_status;
		alert('변경되었습니다.');
	});
});

//관리자 희망도서 목록 검색창 변경
$("#wishlistSearch").change(function(){	
	if($(this).val()=="wish_title"){
		$("#selectbox").remove();
		var output = '';
		output +='<input type="text" name="keyword" size="16" id="textbox">';
		$("#output").append(output);
	}else{		
		$("#textbox").remove();
		var output = '';
		output +='<select name="keyword" id="selectbox" style="width:150px;">';
		output +='<option value="">선택하세요</option>';
		output +='<option value="0">신청중</option>';
		output +='<option value="1">처리중</option>';
		output +='<option value="2">취소됨</option>';
		output +='<option value="3">소장중</option>';
		output +='</select>';
		$("#output").append(output);
	}
});

/*==================================관리자 도서 목록==================================*/
//관리자 도서 목록 검색창 변경
$("#booklistSearch").change(function(){	
	if($(this).val()=="list_status"){
		$("#textbox").remove();
		var output = '';
		output +='<select name="keyword" id="selectbox" style="width:150px;">';
		output +='<option value="">선택하세요</option>';
		output +='<option value="0">대출가능</option>';
		output +='<option value="1">대출정지</option>';
		output +='</select>';
		$("#output").append(output);
	}else{
		$("#textbox").remove();
		$("#selectbox").remove();
		var output = '';
		output +='<input type="text" name="keyword" size="16" id="textbox">';
		$("#output").append(output);		
	}
});

/*==================================관리자 대출 도서==================================*/
//관리자 대출 목록 검색창 변경
$("#bookrentSearch").change(function(){	
	if($(this).val()=="rent_status"){
		$("#textbox").remove();
		var output = '';
		output +='<select name="keyword" id="selectbox" style="width:150px;">';
		output +='<option value="">선택하세요</option>';
		output +='<option value="0">대출중</option>';
		output +='<option value="1">반납</option>';
		output +='<option value="2">예약중</option>';
		output +='</select>';
		$("#output").append(output);
	}else{
		$("#textbox").remove();
		$("#selectbox").remove();
		var output = '';
		output +='<input type="text" name="keyword" size="16" id="textbox">';
		$("#output").append(output);

	}
});

//관리자 대출 목록 반납,승인 처리시 확인
function bookReturn_event(rent_num,list_title) {
	if(rent_status == 0){
		location.href='updateStatus.do?rent_num='+ rent_num+'&rent_status=1';
		alert("["+list_title+"] 이/가 반납되었습니다.");
	}else{		
		location.href='updateStatus.do?rent_num='+ rent_num+'&rent_status=3';
		alert("["+list_title+"] 이/가 대출대기 처리되었습니다.");
	}		
}

function updatePenalty_event(rent_num,mem_penalty,list_title,mem_id) {	
	location.href='updatePenalty.do?rent_num='+ rent_num+'&mem_penalty='+mem_penalty+'&rent_status=1'+'&mem_id='+mem_id;
	alert("["+list_title+"] 이/가 반납되었습니다.");		
}