$(document).ready(function() {
  saveListing();
  saveListingButton();
})

function saveListingButton(){
  $("button[name=button-save]").on("click", saveListing);
  // $("button[name=button-save]").on("click", function(){
  //   var $this = $(this);
  //     $this.toggleClass('saved');
  //     if($this.hasClass('saved')){
  //         $this.text('Saved');         
  //     } else {
  //         $this.text('Save');
  //     }
  // })
}

function saveListing(){
  // $(".save-btn").on("click", function(){
    var listingParams = {
      listing: {
        name: $(this).closest(".listing-name").val(),
        link: $(this).closest(".listing-link").val()
      }
    }
    console.log($this);
  // $.post("/api/v1/user_listings", listingParams) 
}
// .then(changeButton)
// function changeButton(){  
// }
// 
// function createUserListing() {
// 
// }


