# @cjsx React.DOM 

React = require './react.coffee'
require('object.assign').shim() # Object.assign must be shimmed for spread attr to work

module.exports = React.createClass({
  render: ->
    extraProps =
      colour: 'red'
      speed: 'fast'
    <div {... extraProps} color="blue">
      {<li>click{  <img coolattr /> } </li> for i in [2,3,5]} 
    </div>
})
