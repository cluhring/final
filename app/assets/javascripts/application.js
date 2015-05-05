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
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).ready(function(){

	function showBySearchTerm(listLinks, searchMatch){
		listLinks.each(function (index, element){
			if($(element).text().match(searchMatch)) {
				$(element).show();
			} else {
				$(element).hide();
			}
		});
	}

	function showAll(listLinks, searchMatch){
		listLinks.each(function (index, element){
			$(element).show();
		});
	}

	$('#filter-lists').click(function(){
		var filterBy = $('#list_name').val()
		var $listLinks = $('.all-lists .LISTS')
		var searchMatch = new RegExp(filterBy, "i")
		if($(this).val()==='Filter'){
			showBySearchTerm($listLinks, searchMatch);
			$(this).val('Show All');
		}else{
			showAll($listLinks, searchMatch);
			$(this).val('Filter');
		}
	});

});
