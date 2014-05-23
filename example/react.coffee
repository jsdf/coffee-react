# react mock for tests

elements = require 'coffee-react-transform/lib/htmlelements'

createClass = (cl) ->
  (props = {}, children...) ->
    props.children = children

    type: cl
    props: props

makeEl = (name) ->
  createClass
    render: ->
      [name].concat @children
    displayName: name

module.exports =
  renderComponent: (cls) ->
    component = Object.create cls.type
    component.props = cls.props
    component.render()
  DOM: do ->
    dom = {}
    for name, val of elements
      dom[name] = makeEl name
    dom
  createClass: createClass
