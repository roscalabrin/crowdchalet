// $(document).ready(function() {
//   $(".save-btn").each(function(index, element) {
//     var props = {
//       initialIsUnSaved: $(element).data("initial-is-unsaved"),
//       listing: $(element).data("listing")
//     }
//     ReactDOM.render(
//       React.createElement(SearchResult, props),
//       element
//     )
//   })
// })
// 
// var SearchResult = React.createClass({
//   render: function() {
//     if (this.state.isUnSaved) {
//      return React.createElement("button", {onClick: this.handleClick}, "Save");
//     } else {
//      return React.createElement("button", {onClick: this.handleClick}, "Saved");
//     }
//   },
//   handleClick: function() {
//     var method = this.state.isUnSaved ? "POST" : "DELETE";
//     $.ajax({
//       url: "/user_listings",
//       type: method,
//       data: {listing: this.props.listing},
//       success: function(response){
//         this.setState({isUnSaved: !response.saved});
//       }.bind(this),
//     })
//   },
//   getInitialState: function() {
//     return {isUnSaved: this.props.initialIsUnSaved};
//   }
// })

// 
// $(document).ready(function() {
//   // saveListing();
//   saveListingButton();
// })
// 
// function saveListingButton(){
//   $("button[name=button-save]").on("click", function(){
//     var $this = $(this);
//     var listingParams = {
//           listing: $this.prop("value")
//         }
//     if ($this.text() === "Save") {
//       $this.toggleClass("saved");
//       $this.text("Saved");
//       $.post("/api/v1/user_listings", listingParams);
//     } else {
//       $this.toggleClass("saved");
//       $this.text("Save");
//       $.ajax({
//         url: "/api/v1/user_listings",
//         type: 'DELETE',
//         data: listingParams
//     //     success: function(result) {
//     //     // Do something with the result
//     // }
//       })
//     }
//   })
// }
