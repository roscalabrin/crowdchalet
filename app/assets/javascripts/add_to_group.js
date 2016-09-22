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
    location.reload();
  })
  $(".remove-btn").click(function() {
    location.reload();
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