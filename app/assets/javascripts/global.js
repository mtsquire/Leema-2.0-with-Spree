function getViewport() {
    var a, b;
    return "undefined" != typeof window.innerWidth ? (a = window.innerWidth, b = window.innerHeight) : "undefined" != typeof document.documentElement && "undefined" != typeof document.documentElement.clientWidth && 0 != document.documentElement.clientWidth ? (a = document.documentElement.clientWidth, b = document.documentElement.clientHeight) : (a = document.getElementsByTagName("body")[0].clientWidth, b = document.getElementsByTagName("body")[0].clientHeight), [a, b]
}
function absCenterVertical() {
    $(".abs-center").each(function() {
        var a = $(this).outerHeight() / -2;
        $(this).css("margin-top", a)
    })
}
function absTopThirdVertical() {
    $(".abs-topthird").each(function() {
        var a = $("#menu").outerHeight(), b = Math.max($(".masthead").outerHeight() / 3.5, a + 130);
        $(this).css("margin-top", b)
    })
}
function getInternetExplorerVersion() {
    var a = -1;
    if ("Microsoft Internet Explorer" == navigator.appName) {
        var b = navigator.userAgent, c = new RegExp("MSIE ([0-9]{1,}[.0-9]{0,})");
        null != c.exec(b) && (a = parseFloat(RegExp.$1))
    } else if ("Netscape" == navigator.appName) {
        var b = navigator.userAgent, c = new RegExp("Trident/.*rv:([0-9]{1,}[.0-9]{0,})");
        null != c.exec(b) && (a = parseFloat(RegExp.$1))
    }
    return a
}