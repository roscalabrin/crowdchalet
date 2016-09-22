$(document).ready(function() {
  $( ".dropdown-location" ).change(function() {
    var rank = $(this).val();
    $.ajax({
      url: "/rank_locations",
      data: {rank: rank},
      type: "POST"
    })
    location.reload();
  });
  
});