$(function() {
  $("a.collapsible").on('click', function (e) {
    e.preventDefault();

    collapse_id = $(this).attr('id');

    $('div.collapsible#' + collapse_id).slideToggle(200).toggleClass('active');
    $('a.collapsible#' + collapse_id).toggleClass('active');
    $('a.collapsible#' + collapse_id).toggleClass('inactive');
  });
});