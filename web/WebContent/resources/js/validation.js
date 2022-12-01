function CheckAddNThing(){
	"use strict";
	//카테고리 라디오 버튼 vaildation 추가
	var category = document.getElementById("category");
	var NThingName = document.getElementById("NThingName");
	var unitPrice = document.getElementById("unitPrice");
	var unitsInStock = document.getElementById("unitsInStock");
	window.addEventListener("load", function() {
		var form = document.getElementById('needs-validation');
		form.addEventListener("submit", function(event) {
			if (form.checkValidity() == false) {
				event.preventDefault();
				event.stopPropagation();
				form.classList.add("was-validated");
			}

			// 서버 연동 처리
		}, false);
	}, false);

	// 분류코드 체크
	// if(!check(/[^a-zA-Z]/g, category,
	// 	"[제품 코드]\n제품 코드를 입력해주세요!\n" +
	// 	"생활용품:HOUSE, 취미용품:HOBBY, 음식배달:DELIVER, 기타:EXC"))
	// 	return false;

	//제품명 체크
	if(NThingName.value.length < 4 || NThingName.value.length > 12){
		alert("[제품명]\n최소 4자에서 12자까지 입력하세요.");
		NThingName.select();
		NThingName.focus();
		return false;
	}

	//상품 원가 체크
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
