function getViewport(){var e,t;return"undefined"!=typeof window.innerWidth?(e=window.innerWidth,t=window.innerHeight):"undefined"!=typeof document.documentElement&&"undefined"!=typeof document.documentElement.clientWidth&&0!=document.documentElement.clientWidth?(e=document.documentElement.clientWidth,t=document.documentElement.clientHeight):(e=document.getElementsByTagName("body")[0].clientWidth,t=document.getElementsByTagName("body")[0].clientHeight),[e,t]}function absCenterVertical(){$(".abs-center").each(function(){var e=$(this).outerHeight()/-2;$(this).css("margin-top",e)})}function absTopThirdVertical(){$(".abs-topthird").each(function(){var e=$("#menu").outerHeight(),t=Math.max($(".masthead").outerHeight()/3.5,e+130);$(this).css("margin-top",t)})}function getInternetExplorerVersion(){var e=-1;if("Microsoft Internet Explorer"==navigator.appName){var t=navigator.userAgent,n=new RegExp("MSIE ([0-9]{1,}[.0-9]{0,})");null!=n.exec(t)&&(e=parseFloat(RegExp.$1))}else if("Netscape"==navigator.appName){var t=navigator.userAgent,n=new RegExp("Trident/.*rv:([0-9]{1,}[.0-9]{0,})");null!=n.exec(t)&&(e=parseFloat(RegExp.$1))}return e}