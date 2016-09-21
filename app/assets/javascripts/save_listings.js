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
      // return <button style={letterStyle} onClick={this.click.bind(this)}>Save</button>
      return React.createElement("button", {className: "test", onClick: this.handleClick}, "Save");
    } else {
     return React.createElement("button", {onClick: this.handleClick}, "Saved");
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
