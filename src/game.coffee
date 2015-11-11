# Dylan Davidson
# Final Project - CAP 4720
#
class @Game
  constructor: ->
    @base = new Base()

  render: ->
    @base.render()

  addToScene: (object) ->
    @base.addToScene(object)

  removeFromScene: (object) ->
    @base.removeFromScene(object)
