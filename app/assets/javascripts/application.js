// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require_self 

$(document).on('turbolinks:load', function () {
    $(function () {
        let topMessage = $('.top-message');
        let navItem = $('.nav-item a');

        $(window).scroll(function () {
            if ($(this).scrollTop() >= 80 && 120 >= $(this).scrollTop()) {
                topMessage.css({ 'color': "#ff5757" })
                navItem.css({ 'color': "#ff5757" })
            } else if ($(this).scrollTop() > 120) {
                topMessage.css({ 'color': "#ff1616" })
                navItem.css({ 'color': "#ff1616" })

            } else {
                topMessage.css({ 'color': "#000" })
                navItem.css({ 'color': "#000" })
            }
        })

    })
})


