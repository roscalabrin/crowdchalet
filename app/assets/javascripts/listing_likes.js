$(document).ready(function() {
  $(".like-listing").each(function(index, element) {
    var props = {
      initialIsUnliked: $(element).data("initial-is-unliked"),
      userRankingID: $(element).data("user-ranking-id")
    } 
    ReactDOM.render(
      React.createElement(LikeListing, props),
      element
    )
  })
  $(".like-btn").click(function() {
    location.reload();
  })
  $(".liked-btn").click(function() {
    location.reload();
  })
  
})

var LikeListing = React.createClass({
  render: function() {
    if (this.state.isUnliked) {
     return React.createElement("button", {className: "like-btn", onClick: this.handleClick}, "Like");
    } else {
     return React.createElement("button", {className: "liked-btn", onClick: this.handleClick}, "Liked");
    }
  },
  handleClick: function() {
    var method = this.state.isUnliked ? "POST" : "DELETE";
    console.log(this.props.userRankingID);
    $.ajax({
      url: "/likes",
      type: method,
      data: {listing: this.props.userRankingID},
      success: function(response){
        this.setState({isUnliked: !response.liked});
      }.bind(this),
    })
  },
  getInitialState: function() {
    return {isUnliked: this.props.initialIsUnliked};
  }
})
