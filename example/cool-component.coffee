# @cjsx React.DOM 

React = require '../test/react'

CoolComponent = React.createClass
  render: ->
    <div className="neat-component">
      <p>is this component neat? {@props.neat}</p>
    </div>

module.exports = CoolComponent