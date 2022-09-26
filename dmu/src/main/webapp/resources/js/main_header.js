$(document).ready(function(){

$('.sub-menu').hide();

$('.visit').mouseenter(function(){
    if($('.sub-menu').css('display') == 'none'){
        $('#menu_visit').show();
    }else{
        $('#menu_visit').hide();
    }

});

$('.visit').mouseleave(function() {
    $(this).remove('#menu_visit');
});


$('.exhibition').mouseenter(function(){
    if($('.sub-menu').css('display') == 'none'){
        $('#menu_exhibition').show();
    }else{
        $('#menu_exhibition').hide();
    }
});

$('.exhibition').mouseleave(function() {
    $(this).remove('#menu_exhibition');
});

$('.learn').hover(function(){
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









