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

//   

// 
// $(document).ready(function() {
//   $(".location-rank").each(function(index, element) {
//     var props = {
//       initialIsOk: $(element).data("initial-is-ok"),
//       groupListindID: $(element).data("user-ranking-id")
//     } 
//     ReactDOM.render(
//       React.createElement(LocationRank, props),
//       element
//     )
//   })
//   // $(".like-btn").click(function() {
//   //   location.reload();
//   // })
//   // $(".liked-btn").click(function() {
//   //   location.reload();
//   // })
//   
// })
// 
// var LocationRank = React.createClass({
//   render: function() {
//     const options = [
//   'one', 'two', 'three'
// ]
// return React.createElement("select", {className: "liked-btn", placeholder: "Select an option", onClick: this.handleClick}, options);
//     // <Dropdown options={options} onChange={this._onSelect} value={defaultOption} placeholder="Select an option" />
//     // if (this.state.isOk) {
//     //  return React.createElement("button", {className: "like-btn", onClick: this.handleClick}, "Like");
//     // } else {
//     //  return React.createElement("button", {className: "liked-btn", onClick: this.handleClick}, "Liked");
//     // }
//   },
//   handleClick: function() {
//     var method = this.state.isUnliked ? "POST" : "DELETE";
//     console.log(this.props.userRankingID);
//     $.ajax({
//       url: "/likes",
//       type: method,
//       data: {listing: this.props.groupListingID},
//       success: function(response){
//         this.setState({isUnliked: response.location});
//       }.bind(this),
//     })
//   },
//   getInitialState: function() {
//     return {isUnliked: this.props.initialIsOk};
//   }
// })
