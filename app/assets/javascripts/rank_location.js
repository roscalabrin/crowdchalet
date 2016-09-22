$(document).ready(function() {
  $(".dropdown-button").click(function() {
    var $button, $menu;
    $button = $(this);
    $menu = $button.siblings(".dropdown-menu");
    $menu.toggleClass("show-menu");
    $menu.children("li").click(function() {
      $menu.removeClass("show-menu");
      $button.html($(this).html());
    });
  });
  
  $( ".dropdown-location" ).change(function() {
    console.log($( this ).val() );
    var params = {
      location: {
        rank: $( this ).val()
      }
    }
    $.ajax({
      url: "/rank_locations",
      data: params,
      type: "post"
    })
  });
});