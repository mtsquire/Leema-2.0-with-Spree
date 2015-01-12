var getViewport = function() {
    var viewPortWidth;
    var viewPortHeight;
    if (typeof window.innerWidth != 'undefined') {
        viewPortWidth = window.innerWidth,
        viewPortHeight = window.innerHeight
    }
    else if (typeof document.documentElement != 'undefined' && typeof document.documentElement.clientWidth != 'undefined' && document.documentElement.clientWidth != 0) {
        viewPortWidth = document.documentElement.clientWidth,
        viewPortHeight = document.documentElement.clientHeight
    }
    else {
        viewPortWidth = document.getElementsByTagName('body')[0].clientWidth,
        viewPortHeight = document.getElementsByTagName('body')[0].clientHeight
    }
    return [viewPortWidth, viewPortHeight];
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

