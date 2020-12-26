$(function(){
    /* 날짜 객체 받아서 문자열로 리턴하는 함수 */
    function getDateStr(myDate){
        return (myDate.getFullYear() + '-' + ("0"+(myDate.getMonth() + 1)).slice(-2) + '-' + myDate.getDate())
    };
    
    /* 오늘 날짜를 문자열로 반환 */
    function today() {
        var d = new Date()
        return getDateStr(d)
    };
    
    /* 오늘로부터 1주일전 날짜 반환 */
    function lastWeek() {
        var d = new Date()
        var dayOfMonth = d.getDate()
        d.setDate(dayOfMonth - 7)
        return getDateStr(d)
    };
    
    /* 오늘로부터 1개월전 날짜 반환 */
    function lastMonth() {
        var d = new Date()
        var monthOfYear = d.getMonth()
        d.setMonth(monthOfYear - 1)
        return getDateStr(d)
    };

    /* 오늘로부터 3개월전 날짜 반환 */
    function threeMonthsAgo() {
        var d = new Date()
        var monthOfYear = d.getMonth()
        d.setMonth(monthOfYear - 3)
        return getDateStr(d)
    };

    /* 오늘로부터 6개월전 날짜 반환 */
    function sixMonthsAgo() {
        var d = new Date()
        var monthOfYear = d.getMonth()
        d.setMonth(monthOfYear - 6)
        return getDateStr(d)
    };
    
    $("#endDate").val(today());
    $("#startDate").val(threeMonthsAgo());
    
    $("#today").click(function(){
        $("#startDate").val(today());
        $("#endDate").val(today());
    });
    $("#1week").click(function(){
        $("#startDate").val(lastWeek());
        $("#endDate").val(today());
    });
    $("#1month").click(function(){
        $("#startDate").val(lastMonth());
        $("#endDate").val(today());
    });
    $("#3month").click(function(){
        $("#startDate").val(threeMonthsAgo());
        $("#endDate").val(today());
    });
    $("#6month").click(function(){
        $("#startDate").val(sixMonthsAgo());
        $("#endDate").val(today());
    });
})