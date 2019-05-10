$(document).ready(function () {
  $('.artist_form').keyup(function () {
    var search = $(this).val();
    if (search != '') {
      var datObject;
      $.ajax({
        url: '/autocomplete',
        method: 'GET',
        dataType: 'json',
        data: { what: 'artists', term: search },
        success: function (result) {
          $('#artists-hits').empty();
          var len = result.data.length;
          for (var i = 0; i < len; i++) {
            var id = result.data[i].id;
            var name = result.data[i].name;
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

$(document).ready(function () {
  $('.genre_form').keyup(function () {
    var search = $(this).val();
    if (search != '') {
      var datObject;
      $.ajax({
        url: '/autocomplete',
        method: 'GET',
        dataType: 'json',
        data: { what: 'genres', term: search },
        success: function (result) {
          $('#genres-hits').empty();
          var len = result.data.length;
          for (var i = 0; i < len; i++) {
            var id = result.data[i].id;
            var name = result.data[i].name;
            if (len > 0) {
              $('#genres-hits').append('<a href="/genres/' + id + '"><li>' + name + '</li></a>');
            }
          }
        },
      });
    } else {
      $('#genres-hits').empty();
    }
  });
});
