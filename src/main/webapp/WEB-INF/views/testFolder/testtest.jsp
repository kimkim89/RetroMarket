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

/*function selAdd() {
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
}*/

/*function valadd() {
	var chc = $("#ZZZ123").val();
	alert(chc);
	$(".sevalue").attr("name", chc);
	$(".sevalue").attr("id", chc);
}*/

/*function fiAdd() {
	
	
}*/

/*function seList() {
	var seLists = "<div><select class='mytest' name='nn"+i+"' id='ZZZ123"+i+"' onChange='valcH("+i+")'>";
	for(j=0; j<10; j++) {
		seLists += "<option value='"+j+"'>sadsda_"+j+"</option>";
	}
	seLists += "</select></div>";
	seLists += '<input type="text" class="sevalue" value="" id="test'+i+'" name="" />';
	i++;
	alert(i);
	
	return seLists;
}*/


/*20210628 복습 시작*/
var c = 1;
var testArray = ['', 'AAA', 'BBB', 'CCC', 'DDD', 'EEE', 'FFF', 'GGG', 'HHH', 'III', 'JJJ', 'KK'];
var selectTag = "";

//(3)
function addSelNInput(){
	$("#testDiv").append(dynamicTags());
}

//(2)
function addSelectNInputValue(index){
	//alert(index);
	var inputName = ".wr_" + index;	
	var intputValue = $(".inputClass");
	var selectBoxAttr = "#mytest_" + index;
	var selectBoxValue = $(selectBoxAttr).val();
	
	$(".inputClass"+index).val(selectBoxValue);
	
	$("inputClass").attr("name", inputName);
	$("inputClass").attr("id", inputName);	
	
}
		
//(1) 동적으로 생성할 태그
function dynamicTags() {	
		selectTag = '<select class="mytest_'+c+'" id="mytest_'+c+'" onchange="addSelectNInputValue('+c+');">';
			for(var d=1; d<=testArray.length; d++) {
				selectTag += '<option value="'+d+'" name="d_option_'+d+'">d_option_'+d+'</option>';	
			}
		selectTag +='</select>';
		selectTag += '<input type="text" class="inputClass'+c+'" name="" id="" value="" /><br>';
		c++;
	return selectTag;
}


</script>
</head>
<body>

<hr>
<button type="button" onclick="addSelNInput();">추가</button>
<div id="testDiv">


</div>


							
							
<hr>							
							<div id="testDiv2">
								<button type="button" onclick="test3()" style="color: black;">테스트 버튼</button>
								<button type="button" onclick="testAdd()" style="color: black;">테스트 버튼 추가</button>
								<button type="button" onclick="selAdd()" style="color: black;">셀렉트 박스 값 추가</button>
								<button type="button" onclick="valcH()" style="color: black;">셀렉트 박스 값 확인</button>
								<button type="button" onclick="valadd()" style="color: black;">셀렉트 박스 값 입력</button>
								<button type="button" onclick="fiAdd()" style="color: black;">셀렉트 박스, 인풋 박스 추가</button>
								<a href="${contextPath}/mypage/y2">ddd</a>
								
							</div>
							
<!-- <div id="tttest"> -->
<!-- <input type="text" class="sevalue" value="" id="" name="" /> -->
<!-- </div> -->


</body>
</html>