$(document).ready(function() {
  $(".save-btn").each(function(index, element) {
    var props = {
      initialIsUnSaved: $(element).data("initial-is-unsaved"),
      listing: $(element).data("listing")
    }
    ReactDOM.render(
      React.createElement(SearchResult, props),
      element
    )
  })
})

var SearchResult = React.createClass({
  render: function() {
    if (this.state.isUnSaved) {
      return React.createElement("button", {className: "save-btn", onClick: this.handleClick}, "Save");
    } else {
     return React.createElement("button", {className: "saved-btn", onClick: this.handleClick}, "Saved");
    }
  },
  handleClick: function() {
    var method = this.state.isUnSaved ? "POST" : "DELETE";
    $.ajax({
      url: "/user_listings",
      type: method,
      data: {listing: this.props.listing},
      success: function(response){
        this.setState({isUnSaved: !response.saved});
      }.bind(this),
    })
  },
  getInitialState: function() {
    return {isUnSaved: this.props.initialIsUnSaved};
  }
})