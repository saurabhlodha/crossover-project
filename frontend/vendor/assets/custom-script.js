$(document).ready(function () {
  (function ($) {
    $('body').on('keyup', '#filter', function () {

        var rex = new RegExp($(this).val(), 'i');
        var start_date = new Date($(this).val());
        $('.searchable tr').addClass("search_hide");
        $('.searchable tr').filter(function () {
            return rex.test($(this).text());
        }).removeClass("search_hide");

    });
    $('body').on('change', '#after_start_date', function () {

        var date = new Date($(this).val());
        console.log(date);
        $('.searchable tr').addClass("start_date_hide");
        $('.searchable tr .start_date').filter(function () {
            return (date < (new Date($(this).text())));
        }).parent().removeClass("start_date_hide");

    });
    $('body').on('change', '#before_end_date', function () {

        var date = new Date($(this).val());
        console.log(date);
        $('.searchable tr').addClass("end_date_hide");
        $('.searchable tr .end_date').filter(function () {
            return (date > (new Date($(this).text())));
        }).parent().removeClass("end_date_hide");

    });
    $('body').on('click', '#print_button', function() {
      window.print();
    })
  }(jQuery));
});