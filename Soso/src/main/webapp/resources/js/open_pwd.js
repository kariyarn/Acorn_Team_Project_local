$(document).ready(function(){
// 눈 아이콘을 누르면 입력한 비밀번호가 보이도록 설정
    $('button[id=openpwd]').on('click', function() {
        $('#pwd').toggleClass('active');
        if ($('#pwd').hasClass('active')) {
            $(this).attr('class', "btn btn-outline-secondary bi-eye")
            $('#pwd').attr('type', 'text');
        } else {
            $(this).attr('class', "btn btn-outline-secondary bi-eye-slash")
            $('#pwd').attr('type', 'password');
        }
    });
    $('button[id=openpwd2]').on('click', function() {
        $('#pwd2').toggleClass('active');
        if ($('#pwd2').hasClass('active')) {
            $(this).attr('class', "btn btn-outline-secondary bi-eye")
            $('#pwd2').attr('type', 'text');
        } else {
            $(this).attr('class', "btn btn-outline-secondary bi-eye-slash")
            $('#pwd2').attr('type', 'password');
        }
    });
})