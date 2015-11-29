# Dylan Davidson
# Final Project - CAP 4720
#

window.DEGREES_TO_RADIANS = 0.0174533

window.timeout = (time, method) ->
  setTimeout(method, time)

class @Game
  constructor: ->
    @models = window.models
    @base = new Base()
    @menu = new Menu(@)
    @controller = new Controller(@)
    @base.setCameraPosition(0, -300, 0)
    @base.setCameraLook(0, 0, 0)
    @base.spotlight.intensity = 0.15
    @base.setLightPosition(0, -200, 0)
    @base.setLightLook(0, 0, 0)

  start: ->
    @menu.hide()
    @base.spotlight.intensity = 0.2
    @base.setLightPosition(LIGHT_POSITION.x, LIGHT_POSITION.y, LIGHT_POSITION.z)
    @level = new Level(@)
    @player = new Player(@)
    @base.follow(@player)

  render: ->
    if @player
      @player.update()
      @checkWin()
    @controller.update()
    @base.render()

  checkWin: ->
    if @player.getPosition().y >= @level.currentLength()
      if @level.hasNextLevel()
        @level.nextLevel()
        @player.reset()
      else
        console.log('Win!')

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
