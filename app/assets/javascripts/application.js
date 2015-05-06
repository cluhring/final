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

	function showBySearchName(listLinks, searchMatch){
		listLinks.each(function (index, element){
			if($(element).text().match(searchMatch)) {
				$(element).show();
			} else {
				$(element).hide();
			}
		});
	}

	function showAllNames(listLinks, searchMatch){
		listLinks.each(function (index, element){
			$(element).show();
		});
	}

	$('#filter-lists1').click(function(){
		var filterBy = $('#list_name').val()
		var $listLinks = $('.all-lists .LISTS')
		var searchMatch = new RegExp(filterBy, "i")
		debugger;
		if($(this).val()==='Filter Name'){
			showBySearchName($listLinks, searchMatch);
			$(this).val('Show All');
		}else{
			showAllNames($listLinks, searchMatch);
			$(this).val('Filter Name');
		}
	});

	function showBySearchStatus(listLinks, searchMatch){
		listLinks.each(function (index, element){
			if($(element).text().match(searchMatch)) {
				$(element).show();
			} else {
				$(element).hide();
			}
		});
	}

	function showAllStatus(listLinks, searchMatch){
		listLinks.each(function (index, element){
			$(element).show();
		});
	}

	$('#filter-lists3').click(function(){
		var filterBy = $('#list_status').val()
		var $listLinks = $('.all-lists .LISTS')
		var searchMatch = new RegExp(filterBy, "i")
		if($(this).val()==='Filter Status'){
			showBySearchStatus($listLinks, searchMatch);
			$(this).val('Show All');
		}else{
			showAllStatus($listLinks, searchMatch);
			$(this).val('Filter Status');
		}
	});

	function showBySearchDate(listLinks, searchMatch){
		listLinks.each(function (index, element){
			if($(element).text().match(searchMatch)) {
				$(element).show();
			} else {
				$(element).hide();
			}
		});
	}

	function showAllDates(listLinks, searchMatch){
		listLinks.each(function (index, element){
			$(element).show();
		});
	}

	$('#filter-lists2').click(function(){
		var filterBy = $('#list_date').val()
		var $listLinks = $('.all-lists .LISTS')
		var searchMatch = new RegExp(filterBy, "i")
		if($(this).val()==='Filter Date'){
			showBySearchDate($listLinks, searchMatch);
			$(this).val('Show All');
		}else{
			showAllDates($listLinks, searchMatch);
			$(this).val('Filter Date');
		}
	});

});
