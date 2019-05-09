$(document).ready(function () {
  $('.my_form').keyup(function () {
    var search = $(this).val();
    if (search != '') {
      var datObject;
      $.ajax({
        url: '/autocomplete',
        method: 'GET',
        dataType: 'json',
        data: { term: search },
        success: function (data) {
          $('#artists-hits').empty();
          var len = data['data'].length;
          for (var i = 0; i < len; i++) {
            var id = data['data'][i]['id'];
            var name = data['data'][i]['name'];
            if (len > 0) {
              $('#artists-hits').append('<a href="/artists/' + id + '"><li>' + name + '</li></a>');
            }
          }
        },
      });
    } else {
      $('#artists-hits').empty();
    }
  });
});
