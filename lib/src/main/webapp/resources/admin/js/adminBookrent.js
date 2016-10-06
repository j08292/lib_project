/*==================================관리자 대여 도서==================================*/
//관리자 대여 목록 검색창 변경
$("#bookrentSearch").change(function(){	
	if($(this).val()=="rent_status"){
		$("#textbox").remove();
		var output = '';
		output +='<select name="keyword" id="selectbox" style="width:150px;">';
		output +='<option value="">선택하세요</option>';
		output +='<option value="0">대여중</option>';
		output +='<option value="2">예약중</option>';
		output +='<option value="3">대여대기</option>';
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

//관리자 대여 목록 반납,승인,대여 처리시 확인
function bookRent_event(rent_num,list_title){//대여대기 도서 -> 대여 처리
	if (confirm("["+list_title+"] 을/를 대여 처리하시겠습니까?") == true) {
		location.href='updateRent.do?rent_num='+ rent_num+'&rent_status=0';
	}else{
		return;
	}
}

function bookReturn_event(rent_num,rent_status,list_title,list_num){//도서 반납처리 -> 반납시 예약중 도서 대여대기로 상태변경	
	if (confirm("["+list_title+"] 을/를 반납하시겠습니까?") == true) {
		location.href='updateReturn.do?rent_num='+ rent_num+'&rent_status=1'+'&list_num='+list_num;
	}else{
		return;
	}
}

function insertPenalty_event(rent_num,mem_id,list_title,penalty_day,list_num){//연체도서 -> 패널티,반납 처리,예약도서 있으면 대여대기로 상태변경
	if (confirm("["+list_title+"] 을/를 반납하시겠습니까?") == true) {
		location.href='insertPenalty.do?rent_num='+ rent_num+'&rent_status=1'+'&mem_id='+mem_id+'&list_title='+list_title+'&penalty_day='+penalty_day+'&list_num='+list_num;		
	}else{
		return;
	}
}

function bookCancel_event(rent_num,list_title,list_num){//대여 or 예약 취소	->예약도서 있으면 대여대기로 상태변경 
	if (confirm("["+list_title+"] 예약을 취소하시겠습니까?") == true) {
		location.href='updateCancel.do?rent_num='+ rent_num+'&rent_status=4'+'&list_num='+list_num;
	}else{
		return;
	}
}

//도서대여 현황 - 배송정보 확인 팝업창 
function popup(rent_num,list_num,mem_id){
	window.open("delivery.do?rent_num="+rent_num+"&list_num="+list_num+"&mem_id="+mem_id,"window","width=480px,height=400px,scrollbars=no,toolbar=no,location=no,directories=no,top=100,left=100,noresize"); 
}