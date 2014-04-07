# @csx React.DOM 

NeatComponent = React.createClass
  render: ->
    {showTitle, neat} = @props

    <div className="neat-component">
      {<h1>A Component Is I</h1> if showTitle}
      Coffeescript really saves a lot of typing...
      {<p>is this component neat? {neat} x{times}</p> for times in [1..10]}
    </div>
