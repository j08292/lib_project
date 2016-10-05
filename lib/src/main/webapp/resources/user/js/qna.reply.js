$(document).ready(function(){
	var currentPage;
	var count;
	var rowCount;
	
	//댓글목록
	function selectData(pageNum,qna_num){
		currentPage = pageNum;
		
		if(pageNum == 1){
			$('#output').empty();
			
		}
		$('loading').show();
		
		//댓글목록
		$.ajax({
			type:'post',
			data:{pageNum:pageNum, qna_num:qna_num},
			url:'qListReplyAjax.do',
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){				
				//로딩이미지 감추기
				$('#loading').hide();
				count = data.count;
				rowCount = data.rowCount;
				var list = data.list;
				
				//count에 음수가 오면 오류가 났다는 의미
				if(count < 0 || list == null){
					alert('목록 호출 오류 발생');
					
				}else{					
					$(list).each(function(index,item){
					
						var output = '';
						output += '<div class="item" id="i'+item.qna_re_num+'">';
						output += '<table class="table"><colgroup><col style="width:10%;"><col style="width:15%;"><col style="width:10%;"><col style="width:15%;"><col style="width:10%;"><col style="width:40%;"></colgroup>';
						output += '<thead><tr><th>처리상태</th><td>YES</td>';
						output += '<th>답변자</th><td>관리자</td>';
						output += '<th>답변일</th>';
						output += '<td>' + item.qna_re_regdate + '</td></tr></thead>';
						output += '<tbody><tr><td colspan="6">' + item.qna_re_content +'</td></tr>';
						output += '</tbody></table>';
						output += ' <hr size="1" noshade>';
						output += ' </div>';
						
						//문서 객체에 추가
						$('#output').append(output);
					});
					
					//paging button 처리
					if(currentPage>=Math.ceil(count/rowCount)){
						//다음 페이지가 없음
						$('.paging_button').hide();
					}else{
						//다음 페이지가 있음
						$('.paging_button').show();
					}
				}
			},
			error:function(){
				//로딩 이미지 감추기
				$('#loading').hide();
				alert('네트워크 오류 발생!');
			}
		});
	}
	
	//다음 댓글 보기 버튼 클릭시 데이터 추가(이벤트연결)
	$('.paging_button input').click(function(){
		var pageNum = currentPage + 1;
		selectData(pageNum, $('#qna_num').val());
		
	});
	
	//초기 데이터(목록) 호출
	selectData(1,$('#qna_num').val());
});






