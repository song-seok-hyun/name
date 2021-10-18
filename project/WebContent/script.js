			function imgButtonClick1()
			{
				document.querySelector('.imgcontainer').style.transform = 'translate(0vw)';
			}
			
			function imgButtonClick2()
			{
				document.querySelector('.imgcontainer').style.transform = 'translate(-100vw)';
			}
			
			function imgButtonClick3()
			{
				document.querySelector('.imgcontainer').style.transform = 'translate(-200vw)';
			}
			
function idOk(){
	opener.frm.id.value=document.frm.id.value;
	opener.frm.reid.value=document.frm.id.value;
	self.close();
}			
			
function idCheck(){
	if(document.frm.id.value == ""){
		alert("아이디를 입력해 주세요.");
		document.frm.id.focus();
		
		return;
	}
	
	var url="idCheck.do?id="+document.frm.id.value; //입력된 아이디보냄
	window.open(url,"_blank_1","toolbar=no,menubar=no,"+
		"scrollbars=yes,resizable=no,width=450,height=200");
	
}
			
function joinCheck(){
	if(document.frm.id.value.length == 0){
		alert("아이디를 써 주세요.");
		document.frm.id.focus();
		
		return false;
	}
	if(document.frm.reid.value.length == 0){
		alert("중복 체크를 하지 않습니다.");
		document.frm.id.focus();
		
		return false;
	}	
	if(document.frm.password.value == 0){
		alert("암호는 반드시 입력해야 합니다.");
		document.frm.pwssword.focus();
		
		return false;
	}
	if(document.frm.password.value != document.frm.password_chk.value){
		alert("암호가 일치하지 않습니다.");
		document.frm.password.focus();
		
		return false;
	}	
	if(document.frm.name.value.length == 0){
		alert("이름을 써 주세요.");
		document.frm.name.focus();
		
		return false;
	}
	if(document.frm.email.value.length == 0){
		alert("이메일을 써 주세요.");
		document.frm.email.focus();
		
		return false;
	}	
	return true;
}	

function idSearch(){
	if(document.frm.name.value.length == 0){
		alert("이름을 써 주세요.");
		document.frm.name.focus();
		
		return false;
	}
	if(document.frm.email.value.length == 0){
		alert("이메일을 써 주세요.");
		document.frm.email.focus();
		
		return false;
	}
	
	var url="search.do?email="+document.frm.email.value+"&name="+document.frm.name.value; 
	window.open(url,"_blank_1","toolbar=no,menubar=no,"+
		"scrollbars=yes,resizable=no,width=450,height=200");
		
}

function idCheckAga(){
	if(document.frm.id.value == ""){
		alert("아이디를 입력해 주세요.");
		document.frm.id.focus();
		
		return;
	}
		
}

function search_su(){
	var parentWindow = window.opener;
    parentWindow.location.href = 'Login.jsp';
	self.close();
}

function search_fa(){
	var parentWindow = window.opener;
    parentWindow.location.href = 'Idsearch.jsp';
	self.close();
}

function pwSearch(){
	if(document.frm_2.id.value.length == 0){
		alert("아이디를 써 주세요.");
		document.frm_2.id.focus();
		
		return false;
	}
	if(document.frm_2.email.value.length == 0){
		alert("이메일을 써 주세요.");
		document.frm_2.email.focus();
		
		return false;
	}
	
	var url="search.do?email="+document.frm_2.email.value+"&id="+document.frm_2.id.value; 
	window.open(url,"_blank_1","toolbar=no,menubar=no,"+
		"scrollbars=yes,resizable=no,width=450,height=200");
		
}



			