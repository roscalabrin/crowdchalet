$(document).ready(function() {
  $(".add-to-group").each(function(index, element) {
    var props2 = {
      initialIsNotAdded: $(element).data("initial-is-not-added"),
      listingData: $(element).data("listing")
    }
    ReactDOM.render(
      React.createElement(AddToGroup, props2),
      element
    )
  })
  $(".add-btn").click(function() {
    console.log("hi");
    location.reload();
    // $.ajax({
    //   url: "/",
    // })
  })
  $(".remove-btn").click(function() {
    console.log("hi");
    location.reload();
    // $.ajax({
    //   url: "/",
    // })
  })
})

var AddToGroup = React.createClass({
  render: function() {
    if (this.state.isNotAdded) {
     return React.createElement("button", {className: "add-btn", onClick: this.handleClick}, "Add to Group");
    } else {
     return React.createElement("button", {className: "remove-btn", onClick: this.handleClick}, "Remove from Group");
    }
  },
  handleClick: function() {
    var method = this.state.isNotAdded ? "POST" : "DELETE";
    $.ajax({
      url: "/group_listings",
      type: method,
      data: {listing: this.props.listingData},
      success: function(response){
        this.setState({isNotAdded: !response});
      }.bind(this),
    })
  },
  getInitialState: function() {
    return {isNotAdded: this.props.initialIsNotAdded};
  }
})
// $(document).ready(function() {
//   // saveListing();
//   addListingButton();
// })
// 
// function addListingButton(){
//   $("button[name=button-add-to-group]").on("click", function(){
//     var $this = $(this);
//     var listingParams = {
//           listing: $this.prop("value")
//         }
//     if ($this.text() === "Add to Group") {
//       $this.toggleClass("added");
//       $this.text("Added to Group");
//       $.post("/group_listings", listingParams);
//     } else {
//       $this.toggleClass("added");
//       $this.text("Add to Group");
//       $.ajax({
//         url: "/api/v1/group_listings",
//         type: 'DELETE',
//         data: listingParams
//     //     success: function(result) {
//     //     // Do something with the result
//     // }
//       })
//     }
//   })
// }
