function open_modal(i){
    var modal = document.getElementsByClassName("modal");
    var body = document.body;
    modal[i].style.display = "block";
    body.overflow = "hidden";
}
function close_modal(i){
    var modal = document.getElementsByClassName("modal");
    var body = document.body;
    modal[i].style.display = "none";
    body.overflow = "auto";
}

function check(modal_num, open_modal_num){
    var passwords = document.getElementsByClassName("passwords");
    if(passwords[open_modal_num].value == "1q2w3e4r"){
        if(open_modal_num == 3){
            if(confirm("정말로 출석 횟수를 초기화 하시겠습니까?")){
                close_modal(modal_num);
                return true;
            }
            else{
                close_modal(modal_num);
                return false;
            }
        }
        else if (open_modal_num == 0 || open_modal_num == 1 || open_modal_num == 2 ){
            close_modal(modal_num);
            open_modal(open_modal_num);
        }
    }
    else{
        alert("패스워드를 잘못 입력하였습니다.")
    }
}

function checking(){
    var password = document.getElementById("password");
    if(password.value == "1q2w3e4r"){
      var check_master = document.getElementById("check_master");
      var check_container = document.getElementById("check_container");
      check_master.style.display = "none";
      check_container.style.display = "block";
      
    }
    else{
        alert("패스워드를 잘못 입력하였습니다.")
    }
}