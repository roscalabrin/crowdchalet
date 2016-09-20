$(document).ready(function() {
  // saveListing();
  addListingButton();
})

function addListingButton(){
  $("button[name=button-add-to-group]").on("click", function(){
    var $this = $(this);
    var listingParams = {
          listing: $this.prop("value")
        }
    if ($this.text() === "Add to Group") {
      $this.toggleClass("added");
      $this.text("Added to Group");
      $.post("/group_listings", listingParams);
    } else {
      $this.toggleClass("added");
      $this.text("Add to Group");
      $.ajax({
        url: "/api/v1/group_listings",
        type: 'DELETE',
        data: listingParams
    //     success: function(result) {
    //     // Do something with the result
    // }
      })
    }
  })
}
