# @cjsx React.DOM 

React = require './react.coffee'

module.exports = React.createClass({
  render: ->
    <div color="blue">
      {<li>click{  <img coolattr /> } </li> for i in [2,3,5]} 
    </div>
})