{classSet} = React.addons

Watch = React.createClass
  componentDidMount: -> @tick new Date

  tick: (prevTime) ->
    return unless @isMounted()
    currentTime = new Date
    @setState {currentTime}
    timeTilNextTick = currentTime.getTime() - prevTime.getTime() - 1000
    setInterval (=> @tick currentTime), timeTilNextTick

  renderDate: ->
    <div>{@state.currentTime.toLocaleDateString()}</div>

  render: ->
    {currentTime} = @state
    <div {...@props} className={classSet @props.className, 'watch'}>
      <span>{currentTime.getHours()}</span>
      <span> : {currentTime.getMinutes()}</span>
      {<span> : {currentTime.getSeconds()}</span> if @props.showSeconds}
      {@renderDate()}
    </div>
