<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
var i=1;

function selAdd() {
	var i;
// 	var testList = seList();
// 	alert(testList);
		$("#tttest").append(seList());
}

function valcH(i2) {
	var zzz12 = "#ZZZ123"+i2;
	var chc = $(zzz12).val();
// 	alert(document.getElementById("ZZZ123").value);
	$("#test"+i2).val(chc);
	alert("랄랄라"+chc);
}

function valadd() {
	var chc = $("#ZZZ123").val();
	alert(chc);
	$(".sevalue").attr("name", chc);
	$(".sevalue").attr("id", chc);
}

function fiAdd() {
	
	
}

function seList() {
	var seLists = "<div><select class='mytest' name='nn"+i+"' id='ZZZ123"+i+"' onChange='valcH("+i+")'>";
	for(j=0; j<10; j++) {
		seLists += "<option value='"+j+"'>sadsda_"+j+"</option>";
	}
	seLists += "</select></div>";
	seLists += '<input type="text" class="sevalue" value="" id="test'+i+'" name="" />';
	i++;
	alert(i);
	
	return seLists;
}

</script>
</head>
<body>

							<div id="testDiv">
								<button type="button" onclick="test3()" style="color: black;">테스트 버튼</button>
								<button type="button" onclick="testAdd()" style="color: black;">테스트 버튼 추가</button>
								<button type="button" onclick="selAdd()" style="color: black;">셀렉트 박스 값 추가</button>
								<button type="button" onclick="valcH()" style="color: black;">셀렉트 박스 값 확인</button>
								<button type="button" onclick="valadd()" style="color: black;">셀렉트 박스 값 입력</button>
								<button type="button" onclick="fiAdd()" style="color: black;">셀렉트 박스, 인풋 박스 추가</button>
								<a href="${contextPath}/mypage/y2">ddd</a>
								
							</div>
							
<div id="tttest">
<input type="text" class="sevalue" value="" id="" name="" />
</div>


</body>
</html>