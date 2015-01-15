// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

function doneResizing() {

    var b = getViewport()[0], c = getViewport()[1];
    if (b != viewPortWidth && (console.log("Viewport Width: " + viewPortWidth + ", New Width: " + b), widthIsWide && 769 > b ? prlxBg = function() {
    } : !widthIsWide && b > 768 || (resizing = !1), widthIsWide = b > 768 ? !0 : !1), c != viewPortHeight && console.log("Viewport Height: " + viewPortHeight + ", New Height: " + c), c != viewPortHeight || b != viewPortWidth)
        if (widthIsWide) {
            var d = c + "px", e = $(".navbar").outerHeight();
            $(".masthead").each(function() {
                $(this).css("height", d).css("margin-top", -e).css("padding-top", e), absTopThirdVertical(), $(this).css("visibility", "visible").css("opacity", "1");

                // Reposition search bar in center of masthead
                searchMargin = $('.masthead').height() / 2;
                searchHeight = $('.search-leema').height() / 2;
                $(".search-leema").css("margin-top", Math.floor(searchMargin - searchHeight))
            })
        } else {
            $(".masthead").css("height", "").css("margin-top", "").css("padding-top", "").css("visibility", "visible").css("opacity", "1"), $(".abs-topthird").css("margin-top", "");
            viewPortHeight = c, viewPortWidth = b;

            // Reposition search bar in center of masthead
            searchMargin = $('.masthead').height() / 2;
            searchHeight = $('.search-leema').height() / 2;
            $(".search-leema").css("margin-top", Math.floor(searchMargin - searchHeight))
        }
    }

var widthIsWide = !1;
$(document).ready(function() {
    // define viewport vairables
    viewPortWidth = getViewport()[0],
    viewPortHeight = getViewport()[1],
    widthIsWide = (viewPortWidth > 768),
    IEVersion = getInternetExplorerVersion();

    if (viewPortWidth = getViewport()[0], viewPortHeight = getViewport()[1], widthIsWide = viewPortWidth > 768, IEVersion = getInternetExplorerVersion(), widthIsWide) {
        var a = viewPortHeight + "px", b = $(".navbar").outerHeight();
        $(".masthead").each(function() {
            $(this).css("height", a).css("margin-top", -b).css("padding-top", b), absTopThirdVertical(), $(this).css("visibility", "visible").css("opacity", "1");
        })
    }

    // Reposition search bar in center of masthead
    searchMargin = $('.masthead').height() / 2;
    searchHeight = $('.search-leema').height() / 2;
    $(".search-leema").css("margin-top", Math.floor(searchMargin - searchHeight))

    var c;
    $(window).on("resize", function() {
        clearTimeout(c), c = setTimeout(doneResizing, 1e3)
    }), window.requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame || function(a) {
        setTimeout(a, 1e3 / 60)
    };
    var d = function(a, b, c, d) {
        var e = a.offset().top, f = a.outerHeight(), g = e - viewPortHeight + c, h = e + f;
        b >= g && h >= b && d(g, h)
    };

    //parrallax covers
    // requestAnimationFrame method:
    window.requestAnimationFrame = window.requestAnimationFrame
        || window.mozRequestAnimationFrame
        || window.webkitRequestAnimationFrame
        || window.msRequestAnimationFrame
        || function(f){setTimeout(f, 1000/60)}

    var isInViewport = function(element,scrolled,offset,callback) {
        var elementTop = element.offset().top,
            elementHeight = element.outerHeight(),
            elementVisibleAt = elementTop - viewPortHeight + offset,
            elementBottom = elementTop + elementHeight;
        if ( (scrolled >= elementVisibleAt) && (scrolled <= elementBottom) ) {
            callback(elementVisibleAt,elementBottom);
        }
    }

    if (widthIsWide) {

    // define function to fire with requestAnimationFrame
    parallaxBackground = function(){
        var scrolled = window.pageYOffset;
        $('#reindeer').each(function(){
            var thisEl = $(this);
            isInViewport(thisEl,scrolled,0,function(elementVisibleAt,elementBottom){
                thisEl.css('background-position', '50% ' + ( 100 - ( ( scrolled - elementVisibleAt ) / elementBottom * 100 ) ) + '%');
            });
        });
    }

    parallaxBackground();

    } else {
        parallaxBackground = function(){}
    }

        // fire parallax functions on scroll through requestAnimationFrame if not oldIE
    if ( !($('html').hasClass('lt-ie9')) ) {
        window.addEventListener('scroll', function(){
            requestAnimationFrame(parallaxBackground)
        }, false)
    }
});
