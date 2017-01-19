var xmlhttp;
    	if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
    	  xmlhttp=new XMLHttpRequest();//create new XMLHttpRequest object;
    	}
    	else{// code for IE6, IE5
    	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");//这句话是一般是为IE浏览器创建建ajax引擎的，IE不支持所有要先创建，前面会有个判断语句，支持Ajax的浏览器就不需要创建，要判断下的
    	}
//以上是sending data without loading

function checkLogin(frm) {
	var username=frm.username.value;
	var password=frm.password.value;

	if(username.length<1 || password.length<1) {
		document.getElementById('error').innerHTML='<blink><font color="red"/>Please Enter an valid username & password..</blink>';
		return false;
	}
}

function checkRegistration(frm) {
	var firstname =frm.firstname.value;
	var lastname = frm.lastname.value;
	var username=frm.username.value;

	var bday=frm.bday.value;
	var bmonth=frm.bmonth.value;
	var byear=frm.byear.value;

    var gender=frm.gender;

	var password=frm.password.value;
	var cpassword=frm.cpassword.value;

	var terms=frm.terms;

	var filtername=/^[a-zA-Z]*$/;
	
	if(firstname.length<1) {
		document.getElementById('firstname').innerHTML='<blink><font color="red"/>Firstname is Required..!!</blink>';
		return false;
	}else if((!filtername.test(firstname))) {
		alert('Fisrtname must contains alphabets only !!');
		return false;
	}else{
		document.getElementById('firstname').innerHTML='';
		
	}
	
	if(lastname.length<1) {
		document.getElementById('lastname').innerHTML='<blink><font color="red"/>Lastname is Required..!!</blink>';
		return false;
	}else if((!filtername.test(lastname))) {
		alert('Lastname must contains alphabets only !!');
		return false;
	}else{
		document.getElementById('lastname').innerHTML='';
		
	}
		
	if(username.length<1) {
		document.getElementById('username').innerHTML='<blink><font color="red"/>Username Rquired..!!</blink>';
		return false;
	} else if(username.length<4) {
		document.getElementById('username').innerHTML='<blink><font color="yellow"/>Username must have atleast 4 characters..</blink>';
		return false;
	}else {
		document.getElementById('username').innerHTML='';
	}

	if(bmonth=="Month" || bday=="Day"||byear=="Year") {
		document.getElementById('dob').innerHTML='<blink><font color="red"/>Please select your Date of Birth..</blink>';
		return false;
	}else{
		document.getElementById('dob').innerHTML='';		
	}

	if(gender[0].checked==false && gender[1].checked==false && gender[2].checked==false) {
		document.getElementById('gender').innerHTML='<blink><font color="red"/>Please choose your Gender..</blink>';
		return false;
	}else{
		document.getElementById('gender').innerHTML='';
		
	}

	if(password.length<1) {
		document.getElementById('password').innerHTML='<blink><font color="red"/>Enter password..</blink>';
		return false;
	}else if(password.length<4) {
		document.getElementById('password').innerHTML='<blink><font color="red"/>Too short..</blink>';
		return false;
	}else{
		document.getElementById('password').innerHTML='';
	}

	if(cpassword.length<1) {
		document.getElementById('cpassword').innerHTML='<blink><font color="red"/>Re-Enter password..</blink>';
		return false;
	}else if(cpassword!=password) {
		document.getElementById('cpassword').innerHTML='<blink><font color="red"/>Password does not match..</blink>';
		return false;
	}else{
		document.getElementById('cpassword').innerHTML='';
		
	  }

	if(terms.checked==false) {
		alert("You must agree terms & Conditions..!!")
	 return false;	
	}
}

function checkUsername() {//checking username in the textbox, 取得id为checkusername的元素对象
	var username=document.getElementById('checkusername').value//get username from the textbox having id "username"
  if(username.length>=4) {
	//	alert('hii'+username)
	xmlhttp.open("POST","checkusername?username="+username,true);//用ajax来检测
	document.getElementById("username").innerHTML = '<img src="download.gif" border="0" alt="Loading, please wait..." />';
    xmlhttp.onreadystatechange=function() {   
        if(xmlhttp.readyState==4 && xmlhttp.status==200) {
        	document.getElementById("username").innerHTML = xmlhttp.responseText;
         }
      }
      xmlhttp.send(null);
  }
  else {
	document.getElementById('username').innerHTML='<blink><font color="red"/>Username must have atleast 4 characters..</blink>';	  
  }
} 

