$(document).ready(function() {
  // saveListing();
  saveListingButton();
})

function saveListingButton(){
  $("button[name=button-save]").on("click", function(){
    var $this = $(this);
    var listingParams = {
          listing: $this.prop("value")
        }
    if ($this.text() === "Save") {
      $this.toggleClass("saved");
      $this.text("Saved");
      $.post("/api/v1/user_listings", listingParams);
    } else {
      $this.toggleClass("saved");
      $this.text("Save");
      $.ajax({
        url: "/api/v1/user_listings",
        type: 'DELETE',
        data: listingParams
    //     success: function(result) {
    //     // Do something with the result
    // }
      })
    }
  })
}
