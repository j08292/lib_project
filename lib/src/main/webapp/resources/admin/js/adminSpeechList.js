function delete_event(speech_num,countres) {
	if (confirm("정말 삭제하시겠습니까?") == true) { //확인
		if(countres>0){
			alert('신청인원이 있어 삭제 불가합니다.');
			return;
		}else{
			location.href = 'delete.do?speech_num='+speech_num;
		}
	} else {
		return;
	}
}