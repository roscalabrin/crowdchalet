$(document).ready(function() {
  // saveListing();
  saveListingButton();
})

function saveListingButton(){
  $("button[name=button-save]").on("click", function(){
    var data = ($(this).prop("value"));
    var listingParams = {
          listing: data
        }
    $.post("/api/v1/user_listings", listingParams) 
  })
}

