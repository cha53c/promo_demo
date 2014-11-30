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
//= require_tree .

$(document).ready(function() {
    var button = $('<button class="call_button">Call Now</button>');
    $('.thumbnail').on('click', 'button', function() {
      $(this).before('<div class=\'callnum call_button\'>call 0044 123 456 23</div>');
      $(this).remove();
    });

//    TODO deltets previously viewed call me button>???
    $('.thumbnail').on('mouseleave', function() {
        var callnum = $(this).children('.caption').children('.callnum');
        callnum.before(button);
        callnum.remove();
    });
//    $('a').on('click', function() {
//        console.log('loading...');
//    });

    $(".date").datepicker({dateFormat: 'yy-mm-dd'});
});
