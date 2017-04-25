$(function(){
  $('[data-toggle="city-picker"]').each(function(){
    var citypickerInput = $(this);
    var codeInput = $(this).siblings('input[data-city-picker-value]');
    citypickerInput.on("cp:updated", function() {
      var citypicker = $(this).data("citypicker");
      var code = citypicker.getCode("district") || citypicker.getCode("city") || citypicker.getCode("province");
      codeInput.val(code);
    });
  })
})
