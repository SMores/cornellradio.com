$(document).ready(function() {

  $('#play').on('click', function() {
    $('#audio').get(0).load();
    $('#audio').get(0).play();
    $('#play').css('display','none');
    $('#stop').css('display', 'inline');
    $('#newWindow').css('display', 'inline');
  });

  $('#stop').on('click', function() {
    $('#audio').get(0).pause();
    $('#play').css('display', 'inline');
    $('#stop').css('display', 'none');
  });
});