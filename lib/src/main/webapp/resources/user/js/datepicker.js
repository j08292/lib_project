$(document).ready(function() {
	var receiveDate;
	var returnDate;
	var rentDate;
	
	/*$(function() {
		$("#receiveDate").datepicker({
			changeMonth : true,
			changeYear : true,
			nextText : '다음 달',
			prevText : '이전 달',
			showButtonPanel : true,
			currentText : '오늘 날짜',
			closeText : '닫기',
			dateFormat : "yy/mm/dd",
			changeMonth: true, 
			dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        minDate: "+2D", 
	        maxDate: "+7D",
	        onSelect: function (dateText, inst) {
	        	receiveDate = dateText;
	        }
		});
		
	});*/

	$(function() {
		$("#rentDate").datepicker({
			changeMonth : true,
			changeYear : true,
			nextText : '다음 달',
			prevText : '이전 달',
			showButtonPanel : true,
			currentText : '오늘 날짜',
			closeText : '닫기',
			dateFormat : "yy-mm-dd",
			changeMonth: true, 
			dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        minDate: "+2D", 
	        maxDate: "+7D",
	        onSelect: function (dateText, inst) {
	        	rentDate = dateText;
	        }
	        	
		});
	});

	$(function() {
		$("#returnDate").datepicker({
			changeMonth : true,
			changeYear : true,
			nextText : '다음 달',
			prevText : '이전 달',
			showButtonPanel : true,
			currentText : '오늘 날짜',
			closeText : '닫기',
			dateFormat : "yy-mm-dd",
			changeMonth: true, 
			dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        minDate: "+2D", 
	        maxDate: "+7D",
	        onSelect: function (dateText, inst) {
	        	returnDate = dateText;
	        }
		});
	});
	
	$('#rent-button').click(function(){
		
		if($('#returnDate').val() == ''){
			alert("날짜를 입력하세요");
			return false;
		}
		if($('#rentDate').val() == ''){
			alert("날짜를 입력하세요");
			$('#rentDate').focus();
		}
		
		alert("결제가 완료되었습니다.");
		
		$.ajax({
			url:'insertDate.do',
			type:'post',
			data:{
				rentDate:rentDate,
				returnDate:returnDate,
				list:$('#list').val()
			},
			dateType:'json',
			cache:false,
			timeout:30000,
			success:function(){
				alert("날짜 입력 성공!");
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	});
});