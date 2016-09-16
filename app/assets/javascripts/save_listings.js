$(document).ready(function() {
  // saveListing();
  saveListingButton();
})

function saveListingButton(){
  $("button[name=button-save]").on("click", function(){
    // var $this = $(this);
    // $this.toggleClass('marked');
    // if($this.hasClass('.marked')){
    //   $this.text('Saved');
    // } else {
    //   $this.text('Save');
    // }
    var data = ($(this).prop("value"));
    var listingParams = {
          listing: data
        }
    $.post("/api/v1/user_listings", listingParams);
  })
}
