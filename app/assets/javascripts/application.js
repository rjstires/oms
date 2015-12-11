// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery/dist/jquery.js
//= require jquery-ui/jquery-ui.js
//= require jquery-ujs/src/rails.js
//= require bootstrap/dist/js/bootstrap.js
//= require moment
//= require eonasdan-bootstrap-datetimepicker
//= require select2
//= require nanoscroller/bin/javascripts/jquery.nanoscroller.min.js
//= require jPushMenu/js/jPushMenu.js
//= require flat-dream/jquery.cookie.js
//= require flat-dream/core.js
//= require flat-dream/dashboard.js
//= require datatables.net/js/jquery.dataTables
//= require datatables.net-bs/js/dataTables.bootstrap
//= require fullcalendar
//= require_tree .

$(document).on("page:load ready", function(){
    $(".datetime").datetimepicker({format: 'YYYY-MM-DD HH:mm'});
    $('.select2').select2();

    $('.table > tbody > tr.clickable').on('click', function(e){
        window.location.href = $(this).data('url');

    });

    $('.datatable').dataTable({
        "pageLength": 15,
        "lengthChange": false
    });
});


function updatePrice()
{
    var sale = parseFloat($("#order_line_sale").val());
    var merchant_fee = sale * 0.03;
    var site_fee = sale * 0.194
    var contractor_payment = sale * 0.776
    $("#order_line_merchant_fee").val(merchant_fee.toFixed(2));
    $("#order_line_site_fee").val(site_fee.toFixed(2));
    $("#order_line_contractor_payment").val(contractor_payment.toFixed(2));
}

$(document).on("change, keyup", "#order_line_sale", updatePrice);

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
