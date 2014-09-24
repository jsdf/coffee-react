NeatComponent = React.createClass
  render: ->
    <div className="neat-component">
      {<h1>A Component is I</h1> if @props.showTitle}
      <hr />
      {<p>This line has been printed {n} times</p> for n in [1..10]}
    </div>