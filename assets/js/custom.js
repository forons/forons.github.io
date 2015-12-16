$(function() {
  $("a.collapsible").on('click', function (e) {
    e.preventDefault();
    $('div.collapsible').slideToggle(200).toggleClass('active');
    $('a.collapsible').toggleClass('active');
    $('a.collapsible').toggleClass('inactive');
  });
});