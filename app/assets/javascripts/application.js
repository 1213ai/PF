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
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require cocoon
/*global $*/


$(document).on('turbolinks:load', function() {

$(function() {
    $(".variable").slick({
        dots: true,
        autoplay: true,
        autoplaySpeed: 3000,
        pauseOnFocus: false,
        pauseOnHover: false,
        pauseOnDotsHover: false
    });
　});
});

$(function (){
  var count = $(".js-text").text().replace(/\n/g, "改行").length;

  var now_count = 150 - count;

  if (count > 150) {
    $(".js-text-count").css("color","red");
  }

  $(".js-text-count").text( "(残り" + now_count + "文字)");

  $(".js-text").on("keyup", function() {

    var count = $(this).val().replace(/\n/g, "改行").length;
    var now_count = 150 - count;

    if (count > 150) {
      $(".js-text-count").css("color","red");
    } else {
      $(".js-text-count").css("color","black");
    }
    $(".js-text-count").text( "残り" + now_count + "文字");
  });
});

$(function (){
  var count = $(".js-text-top").text().replace(/\n/g, "改行").length;

  var now_count = 20 - count;

  if (count > 20) {
    $(".js-text-count").css("color","red");
  }

  $(".js-text-top-count").text( "(残り" + now_count + "文字)");

  $(".js-text-top").on("keyup", function() {

    var count = $(this).val().replace(/\n/g, "改行").length;
    var now_count = 20 - count;

    if (count > 20) {
      $(".js-text-top-count").css("color","red");
    } else {
      $(".js-text-top-count").css("color","black");
    }
    $(".js-text-top-count").text( "残り" + now_count + "文字");
  });
});

$(function() {
  $('#top-btn a').on('click',function(event){
    $('body, html').animate({
      scrollTop:0
    }, 1000);
    event.preventDefault();
  });
});
