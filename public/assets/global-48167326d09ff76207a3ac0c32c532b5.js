function getInternetExplorerVersion(){var e=-1;if("Microsoft Internet Explorer"==navigator.appName){var n=navigator.userAgent,t=new RegExp("MSIE ([0-9]{1,}[.0-9]{0,})");null!=t.exec(n)&&(e=parseFloat(RegExp.$1))}else if("Netscape"==navigator.appName){var n=navigator.userAgent,t=new RegExp("Trident/.*rv:([0-9]{1,}[.0-9]{0,})");null!=t.exec(n)&&(e=parseFloat(RegExp.$1))}return e}var getViewport=function(){var e,n;return"undefined"!=typeof window.innerWidth?(e=window.innerWidth,n=window.innerHeight):"undefined"!=typeof document.documentElement&&"undefined"!=typeof document.documentElement.clientWidth&&0!=document.documentElement.clientWidth?(e=document.documentElement.clientWidth,n=document.documentElement.clientHeight):(e=document.getElementsByTagName("body")[0].clientWidth,n=document.getElementsByTagName("body")[0].clientHeight),[e,n]};