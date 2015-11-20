# Dylan Davidson
# Final Project - CAP 4720
#

window.DEGREES_TO_RADIANS = 0.0174533

window.timeout = (time, method) ->
  setTimeout(method, time)

class @Game
  constructor: ->
    @base = new Base()
    @level = new Level(@)
    @controller = new Controller(@)
    @player = new Player(@)
    @base.follow(@player)

  render: ->
    @player.update()
    @base.render()
    @checkWin()

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
