$(document).ready(function(){

	$('#hand .domino').click(function(){
		var side_one = $(this).find(".side_1").text(),
			side_two = $(this).find(".side_1").text();
		$('#hand .domino').removeClass("selected")
		$(this).addClass("selected");
		$("#hand_domino span").text(side_one + " | " + side_two)
	})
	$('#board .domino').click(function(){
		var side_one = $(this).find(".side_1").text(),
			side_two = $(this).find(".side_1").text();
		$('#board .domino').removeClass("selected")
		$(this).addClass("selected");
		$("#board_domino span").text(side_one + " | " + side_two)
	})


})