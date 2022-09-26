$(document).ready(function(){

$('.sub-menu').hide();

$('.visit').mouseover(function(){
      $('.sub-menu').stop().slideDown().show();
});

$('.visit').mouseout(function() {
	$('#menu_visit').stop().slideUp().show();
});


$('.exhibition').mouseover(function(){
    if($('.sub-menu').css('display') == 'none'){
        $('#menu_exhibition').show();
    }else{
        $('#menu_exhibition').hide();
    }
});

$('.exhibition').mouseout(function() {
    $('#menu_exhibition').hide();
});

$('.learn').mouseover(function(){
    if($('.sub-menu').css('display') == 'none'){
        $('#menu_learn').show();
    }else{
        $('#menu_learn').hide();
    }
});

$('.learn').mouseleave(function() {
    $(this).remove('#menu_learn');
});


$('.event').hover(function(){
	$('.sub-menu').hide();
});

$('.ticket').hover(function(){
    $('.sub-menu').hide();
});

});









