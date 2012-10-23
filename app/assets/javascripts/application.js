// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
	$('.box.standard').shadow();
	$('.box.lifted').shadow('lifted');
	$('.box.perspective').shadow('perspective');
	$('.box.raised').shadow('raised');
	$('.box.sides-vt-1').shadow({type:'sides',sides:'vt-1'});
	$('.box.sides-vt-2').shadow({type:'sides',sides:'vt-2'});
	$('.box.sides-hz-1').shadow({type:'sides',sides:'hz-1'});
	$('.box.sides-hz-2').shadow({type:'sides',sides:'hz-2'});
	$('.box.rotated').shadow({type:'rotated',rotate:'-5deg'});
});