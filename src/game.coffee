# Dylan Davidson
# Final Project - CAP 4720
#
class @Game
  constructor: ->
    @base = new Base()
    @controller = new Controller(@)
    @floor = new Cube(@, 100, 500, 10)
    @floor.setPosition(0, 100, 0)
    @player = new Player(@)
    @base.follow(@player.getObject())

  render: ->
    @player.update()
    @base.render()

  addToScene: (object) ->
    @base.addToScene(object)

  removeFromScene: (object) ->
    @base.removeFromScene(object)

  spacePressed: ->
    @player.jump()
