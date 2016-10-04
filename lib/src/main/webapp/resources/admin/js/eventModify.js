$(document).ready(function(){
	$(function(){
		$('.datepicker').datepicker({
			showMonthAfterYear:true, //'default : 월 년'을 '년 월'로 바꿈
			changeYear:true, //년도 선택할 수 있게
			changeMonth:true,
			dateFormat:'yy-mm-dd',
			monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin:['일','월','화','수','목','금','토']
		});
	}); 
	 
	 $('#register-form').submit(function(){
	 var startDate = $('#event_startdate').val();
     var startDateArr = startDate.split('-');
     var endDate = $('#event_enddate').val();
     var endDateArr = endDate.split('-');   
     var startDateCompare = new Date(startDateArr[0], startDateArr[1], startDateArr[2]);
     var endDateCompare = new Date(endDateArr[0], endDateArr[1], endDateArr[2]);
     if(startDateCompare.getTime() > endDateCompare.getTime()) {
           alert("종료날짜가 시작날짜보다 전날짜입니다.\n 다시 한 번 확인해 주세요.");
           return false;
     }
	 });
});

//관리자 이벤트 수정시 이미지 미리보기
var ImagePreview = (function loadImageFile() {
	if (window.FileReader) {
		var ImagePre; 
		var ImgReader = new window.FileReader();
		var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i; 

		ImgReader.onload = function (Event) {
			document.getElementById("beforeImage").remove();
			if (!ImagePre) {
				var newPreview = document.getElementById("imagePreview");
				ImagePre = new Image();
				ImagePre.style.width = "200px";
				//ImagePre.style.height = "140px";
				newPreview.appendChild(ImagePre);
			}
			ImagePre.src = Event.target.result;
		};

		return function () {
			var img = document.getElementById("upload").files;

			if (!fileType.test(img[0].type)) { 
				alert("이미지 파일을 업로드 하세요"); 
				return; 
			}
			ImgReader.readAsDataURL(img[0]);
		}
	}
	document.getElementById("imagePreview").src = document.getElementById("upload").value;
})();
