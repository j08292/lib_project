/*$(document).ready(function(){
	var status=null;
	$("#status").change(function(){
		status=$("#status option:selected").val();
	});
	$("saveChange").on('click',function(){
		location.href="updateReserve.do?speech_num="+speech_num+"&speech_reserve_num="+speech_reserve_num+"&status="+status;
	});
});
*/
function updateReserve(speech_num,speech_reserve_num){
	if(speech_num=='' || speech_reserve_num==''){
		alert('오류발생!');
		location.href="reservationList.do";
	}else{
		var status=null;
		status=$("#status option:selected").val();
		$("#status").change(function(){
			status=$("#status option:selected").val();
		});
		location.href="updateReserve.do?speech_num="+speech_num+"&speech_reserve_num="+speech_reserve_num+"&status="+status;
		
	}
}