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

var readLink = '<span></span>';

$(document).ready(function () {
//    truncateDescription();
    var button = $('<button class="call_button">Call Now</button>');
    $('.thumbnail').on('click', '.call_button', function () {
        //TODO populate withe actual phone number
        $(this).before($('.call_button').data('tel'));
//        console.log($(this));
        $(this).remove();
    });

//    TODO delets previously viewed call me button>???
    $('.thumbnail').on('mouseleave', function () {
        var callnum = $(this).children('.caption').children('.callnum');
        callnum.before(button);
        callnum.remove();
    });

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
                        $(element).parent().find('.availability').animate({hidden: false}, 500);
                        $(element).parent().find('.client').animate({hidden: false}, 500);
                        $(element).parent().find('.call_button').animate({hidden: false}, 500);
                        $(element).parent().find('.find_us').animate({hidden: false}, 500);
//                        $(element).parent().find('.availability').css('background-color', '#FFFFFF');
                    }
                    if (! expanded){ // the more link was clicked
                        console.log('expanded false');
                        console.log(element);
                        console.log($(element).parent());
                        console.log($(element).parent().find('.availability'));
//                        $(element).parent().find('.availability').css('background-color', '#0000FF');
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
});

