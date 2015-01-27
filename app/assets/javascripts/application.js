// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require readmore
//= require_tree .


var ready = function () {

    google.maps.event.addDomListener(window, 'load', initMap);
    $(".loader").fadeOut("slow");

    $('.description').data('full-description', 'test data');

    $(".date").datepicker({dateFormat: 'yy-mm-dd', minDate: new Date()});

    $('p.more').each(function() {
        console.log('.more');
        console.log($(this).innerHeight());
        if($(this).innerHeight() > 39){
            console.log("calling readmore");
            $(this).readmore({
                moreLink: '<a href="#" class="read-more-link">Read more ></a>',
                lessLink: '<a href="#" class="read-less-link">&lt; Read less</a>',
                maxHeight: 200,
                collapsedHeight: 45,
                speed: 200,
                beforeToggle: function(trigger, element, expanded) {
                    console.log("before toggle");
                    if(expanded) { // The "less" link was clicked
                        console.log('expanded true');
                        $(element).parent().find('.availability').animate({hidden: false}, 100);
                        $(element).parent().find('.client').animate({hidden: false}, 100);
                        $(element).parent().find('.call_button').animate({hidden: false}, 100);
                        $(element).parent().find('.find_us').animate({hidden: false}, 100);
                    }
                    if (! expanded){ // the 'more' link was clicked
                        console.log('expanded false');
                        $(element).parent().find('.availability').animate({hidden: true}, 500);
                        $(element).parent().find('.client').animate({hidden: true}, 500);
                        $(element).parent().find('.call_button').animate({hidden: true}, 500);
                        $(element).parent().find('.find_us').animate({hidden: true}, 500);
                    }
                },
                afterToggle: function(trigger, element, expanded) {
                    console.log("after toggle");
                    if(! expanded) { // The "Close" link was clicked
                        $('.description').animate( { scrollTop: element.offset().top }, {duration: 100 } );

                    }
                }
            });
        }
    });
};

//$(window).load(ready);
$(document).ready(ready);
$(document).on('page:load', ready);