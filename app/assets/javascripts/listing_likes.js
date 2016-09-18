$(document).ready(function() {
  $(".like-listing").each(function(index, element) {
    ReactDOM.render(
      React.createElement(LikeListing, {initialIsUnliked: $(element).data("initial-is-unliked")}),
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
    this.setState({isUnliked: !this.state.isUnliked});
  },
  getInitialState: function() {
    return {isUnliked: this.props.initialIsUnliked};
  }
});