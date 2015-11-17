# Dylan Davidson
# Final Project - CAP 4720
#

window.DEGREES_TO_RADIANS = 0.0174533

class @Game
  constructor: ->
    @base = new Base()
    @controller = new Controller(@)
    @floor = new Cube(@, 100, 500, 10)
    @floor.setPosition(0, 100, 0)
    @player = new Player(@)
    @base.follow(@player)
    @obstacle = new Low(@, 0)
    @obstacle = new Low(@, 75)
    @obstacle = new High(@, 175)

  render: ->
    @player.update()
    @base.render()

  reset: ->
    @player.reset()

  addToScene: (object) ->
    @base.addToScene(object)

  removeFromScene: (object) ->
    @base.removeFromScene(object)

  jump: ->
    @player.jump()

  slide: ->
    @player.startSlide()

  left: ->
    @player.startLeft()

  right: ->
    @player.startRight()
