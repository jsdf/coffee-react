React = require 'react'

NamedComponent = React.createClass
  render: ->
    extraProps =
      style:
        color: 'red'
      width: 10
    <ul {... extraProps} width={12}>
      {<li key={i}>{i} {<input type="checkbox" defaultChecked />}</li> for i in [2,3,5]} 
    </ul>
