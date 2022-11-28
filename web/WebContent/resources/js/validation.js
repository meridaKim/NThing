function CheckAddNThing(){
	
	var NThingId = document.getElementById("NThingId");
	var NThingName = document.getElementById("NThingName");
	var unitPrice = document.getElementById("unitPrice");
	var unitsInStock = document.getElementById("unitsInStock");
	
	//아이디 체크
	if(!check(/^ISBN[a-zA-Z0-9]{1,8}$/, NThingId,
		"[제품 코드]\nISBN과 숫자를 조합하여 5~12까지 입력하세요.\n첫글자는 반드시 ISBN로 시작하세요." +
		"생활용품:ISBN5, 취미용품:ISBN6, 음식배달:ISBN7, 기타:ISBN8"))
		return false;
	
	//상품명 체크
	if(NThingName.value.length < 4 || NThingName.value.length > 12){
		alert("[제품명]\n최소 4자에서 12자까지 입력하세요.");
		NThingName.select();
		NThingName.focus();
		return false;
	}
	
	//상품가격 체크
	if(unitPrice.value.length == 0 || isNaN(unitPrice.value)){
		alert("[가격]\n숫자만 입력하세요.");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	

	if(unitPrice.value < 0){
		alert("[가격]\n음수는 입력할 수 없습니다.");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	
	// 재고수 체크
	if(isNaN(unitsInStock.value)){
		alert("[재고 수]\n숫자만 입력하세요.");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}
	
	function check(regExp, e, msg){
		if(regExp.test(e.value))
			return true;
		
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	document.newNThing.submit();
}