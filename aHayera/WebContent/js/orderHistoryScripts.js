var date = new Date();
var today= date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();

$(document).ready(function(){

    // 오늘 클릭
    $("#today").click(function(){
        $("#startDate").val(today);
        $("#endDate").val(today);
    });
    // 1주일 클릭
    $("#1week").click(function(){
        $("#endDate").val(today);
    });

})