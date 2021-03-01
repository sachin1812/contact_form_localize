$(document).ready(function(){
  var spinner = $('#loader');
  $(function() {
    $('form').submit(function(e) {
      e.preventDefault();
      spinner.show();
      $.ajax({
        url: 't2228.php',
        data: $(this).serialize(),
        method: 'post',
        dataType: 'JSON'
      }).done(function(resp) {
        spinner.hide();
        alert(resp.status);
      });
    });
  });
});
