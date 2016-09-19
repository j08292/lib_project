$("#marathonSearch").change(function(){
	   if($(this).val()=="mem_id"){      
	      $("#selectbox").remove();
	      var output = '';
	      output +="<input type='text' size='16' name='keyword' id='textbox'>";
		  $("#output").append(output);
	   }else{
	      $("#textbox").remove();
	      var output = '';
			output +="<select name='keyword' id='selectbox'>";
			output +="<option value=''>선택하세요</option>";
			output +="<option value='0'>신청중</option>";
			output +="<option value='1'>발송처리</option>";
			output +="</select>";
			$("#output").append(output);
	   }
});