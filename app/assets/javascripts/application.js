// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery_ujs
//= require_tree .

$(function (){
  var MAX_LENGTH = $("#vote_impression").attr("maxlength");

  $("#count_text").text(MAX_LENGTH + "文字");

  $("#vote_impression").on('keyup', function(){
    var text = $(this).val();
    renderCount(text.length);
  });

  renderCount(0);

  function renderCount(currentLength){
    $("#count_text").text(MAX_LENGTH - currentLength + "文字");
  }
});
