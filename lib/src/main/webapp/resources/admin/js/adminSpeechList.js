function delete_event() {
	if (confirm("정말 삭제하시겠습니까?") == true) { //확인
		location.href = 'updateStatus.do?list_num=${booklist.list_num}';
	} else {
		return;
	}
}