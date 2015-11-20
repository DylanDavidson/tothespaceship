class @Obstacle extends @Entity
  COLOR: 0x95a5a6
  LANES: {
    0: -20,
    1: 0,
    2: 20,
  }

  constructor: (game, y, lane) ->
    @game = game
    @cube = new Cube(@game, 20, 5, 10)
    @cube.setColor(@COLOR)
    @cube.setPosition(@LANES[lane], y, @BASE_Z)
    @cube.object.addEventListener('collision', @collision)

  collision: (other) =>
    if other.name == 'Player'
      @game.reset()

  destroy: ->
    @cube.destroy()
