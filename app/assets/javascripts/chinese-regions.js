$(function(){
  $('[data-toggle="city-picker"]').each(function(){
    var citypickerInput = $(this);
    var identifier = citypickerInput.data('id');
    var codeInput = $(this).siblings('input[data-city-picker-value-for="' + identifier + '"]');
    citypickerInput.on("cp:updated", function() {
      var citypicker = $(this).data("citypicker");
      var code = citypicker.getCode("district") || citypicker.getCode("city") || citypicker.getCode("province");
      codeInput.val(code);
    });
  })
})
