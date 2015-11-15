class @Obstacle extends @Entity
  BASE_Z: 7.5
  COLOR: 0x95a5a6

  constructor: (game, y) ->
    @game = game
    @cube = new Cube(@game, 20, 5, 10)
    @cube.setColor(@COLOR)
    @cube.setPosition(0, y, @BASE_Z)
    @cube.object.addEventListener('collision', @collision)

  collision: (other) =>
    if other.name == 'Player'
      @game.reset()
