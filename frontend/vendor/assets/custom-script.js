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
    $('body').on('change', '#sort_by_status', function () {

        var status = $(this).val();
        $('.searchable tr').addClass("status_filter_hide");
        $('.searchable tr #status').filter(function () {
            return (status == ($(this).text().trim()));
        }).parent().removeClass("status_filter_hide");

    });
    $('body').on('click', '#print_button', function() {
      window.print();
    })
  }(jQuery));
});