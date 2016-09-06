$(".status").change(function(){
	var speech_num=$(this).attr('data-num');
	var speech_reserve_num=$(this).parent().attr('data-num');
	var status = $(this).find('option:selected').val();
	 $('.save_Status').click(function(){
		 location.href="updateReserve.do?speech_num="+speech_num+"&speech_reserve_num="+speech_reserve_num+"&status="+status;
	  });   
});
