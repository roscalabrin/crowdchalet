$(document).ready(function() {
  $(".like-listing").each(function(index, element) {
    var props = {
      initialIsUnliked: $(element).data("initial-is-unliked"),
      groupListingID: $(element).data("group-listing-id")
    }
    ReactDOM.render(
      React.createElement(LikeListing, props),
      element
    )
  })
})

var LikeListing = React.createClass({
  render: function() {
    if (this.state.isUnliked) {
     return React.createElement("div", {onClick: this.handleClick}, "Like");
    } else {
     return React.createElement("div", {onClick: this.handleClick}, "Liked");
    }
  },
  handleClick: function() {
    var method = this.state.isUnliked ? "POST" : "DELETE";
    $.ajax({
      url: "/api/v1/likes",
      type: method,
      data: {listing: this.props.groupListingID},
      sucess: function(response){
        this.setState({isUnliked: true});
      }.bind(this),
    })
  },
  getInitialState: function() {
    return {isUnliked: this.props.initialIsUnliked};
  }
})