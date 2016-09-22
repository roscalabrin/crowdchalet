$(document).ready(function() {
  $( ".dropdown-location" ).change(function() {
    var rank = $(this).val();
    $.ajax({
      url: "/rankings",
      data: {rank: rank},
      type: "POST"
    })
    location.reload();
  });
  
});