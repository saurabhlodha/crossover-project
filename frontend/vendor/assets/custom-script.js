$(document).ready(function () {
  (function ($) {
    $('body').on('keyup', '#filter', function () {

        var rex = new RegExp($(this).val(), 'i');
        $('.searchable tr').hide();
        $('.searchable tr').filter(function () {
            return rex.test($(this).text());
        }).show();

    });
    $('body').on('click', '#print_button', function() {
      window.print();
    })
  }(jQuery));
});