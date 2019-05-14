$(document).ready(function(){
    $('#template_one_about_title').keyup(function () {
        $('#about_title').html($(this).val());
    });
};