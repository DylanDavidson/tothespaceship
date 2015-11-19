# Dylan Davidson
# Final Project - CAP 4720
#

window.DEGREES_TO_RADIANS = 0.0174533

window.timeout = (time, method) ->
  setTimeout(method, time)

class @Game
  constructor: ->
    @base = new Base()
    @controller = new Controller(@)
    @floor = new Cube(@, 100, 500, 10)
    @floor.setPosition(0, 100, 0)
    @floor.setName('Floor')
    @player = new Player(@)
    @base.follow(@player)
    @obstacle = new Low(@, 0, 0)
    @obstacle = new Low(@, 0, 1)
    @obstacle = new Low(@, 0, 2)
    @obstacle = new High(@, 75, 0)
    @obstacle = new High(@, 75, 1)
    @obstacle = new High(@, 75, 2)
    @obstacle = new Low(@, 150, 1)
    @obstacle = new Low(@, 150, 2)
    @obstacle = new Low(@, 225, 0)
    @obstacle = new Low(@, 225, 1)

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
