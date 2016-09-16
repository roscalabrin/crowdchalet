var SaveListing = React.createClass({
  render: function() {
    if (this.state.isSave) {
      return React.createElement("div", {onClick: this.handleClick}, "Unsave");
    } else {
      return React.createElement("div", {onClick: this.handleClick}, "Save");
    }
  },
  handleClick: function() {
    var method = this.state.isSave ? "POST" : "POST";
      var listingParams = {
        listing: {
          name: this.props.listingName
        }
      }
    $.ajax({
      url: "/api/v1/user_listings",
      type: method,
      data: listingParams,
      success: function(response) {
    this.setState({isLiked: response.Saved});
      }.bind(this)
    });
  },
  getInitialState: function() {
    return {isLiked: this.props.initialIsSave};
  }
});

// var saveListing = React.createClass({
//   render: function() {
//     if (this.state.isSave) {
//       return (
//         <div onClick={this.handleClick}>
//           "Unsave"
//         </div>
//       );
//     } else {
//       return (
//         <div onClick={this.handleClick}>
//           "Save"
//         </div>
//       );
//     }
//   },
//   handleClick: function() {
//     var method = this.state.isSave ? "POST" : "DELETE";
//     $.ajax({
//       url: '/api/vi/user_listings' + this.props.listingName + "/likes",
//       type: method,
//       success: function(response) {
//     this.setState({isLiked: response.liked});
//       }.bind(this)
//     });
//   },
//   getInitialState: function() {
//     return {isLiked: this.props.initialIsSaved};
//   }
// });
// 
// $(document).ready(function() {
//   $(".save-listing").each(function(index, element) {
//     var props = {
//       initialIsLiked: $(element).data("initial-is-liked"),
//       articleID: $(element).data("listing-name")
//     }
//     React.render(
//       <LikeArticle initialIsSaved={props.initialIsLiked} articleID={props.articleID} />,
//       element
//     );
//   });
// });
// $(document).ready(function() {
//   saveListing();
//   saveListingButton();
// })
// 
// function saveListingButton(){
//   $("button[name=button-save]").on("click", saveListing);
// }
// 
// function saveListing(){
//   // $(".save-btn").on("click", function(){
//     var listingParams = {
//       listing: {
//         name: $(this).closest(".listing-name").val(),
//         link: $(this).closest(".listing-link").val()
//       }
//     }
//   $.post("/api/v1/user_listings", listingParams) 
// }
// // .then(changeButton)
// // function changeButton(){  
// // }
// // 
// // function createUserListing() {
// // 
// // }


