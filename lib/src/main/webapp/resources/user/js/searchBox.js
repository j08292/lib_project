function getSelectValue(frm) {
	frm.textValue.value = frm.selectBox.options[frm.selectBox.selectedIndex].text;
	var value = frm.selectBox.options[frm.selectBox.selectIndex].text;
	alert(value);
	$('.textValue').val(value);
	alert($('.textValue').val());
}


