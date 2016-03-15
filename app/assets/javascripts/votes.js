// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

//alert("やっほーうごいてるぅ？");
$(function(){
	$("select#vote_magazine_id").change(function(){
		//alert($(this).val());
		$(location).attr("href", "/magazine/" + $(this).val() + "/votes/new");
	});

	//$('#hoge').click(function() {
		//$.ajax(url: "/").done(function(html) {
		//	$("#results").append(html);
	  //});
	//});
});
