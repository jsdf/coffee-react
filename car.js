(function() {
  var Car, React;

  React = require('react');

  Car = React.createClass({
    render: function() {
      return Car({
        "doors": "4",
        "safety": getSafetyRating() * 2,
        "data-top-down": "yep",
        "checked": true
      }, FrontSeat(null), BackSeat(null), React.DOM.p(null, "Which seat can I take?", this.props.seat));
    }
  });

  React.renderComponent(Car({
    "seat": "front, obvs"
  }), document.getElementById('container'));

}).call(this);
