class @Level
  OFFSET: 150

  constructor: (game) ->
    @game = game
    @index = 0
    $.getJSON 'src/levels.json', (json) =>
      @landscape = new THREE.Mesh(Models.landscape.geometry, Models.landscape.materials)
      @landscape.rotation.x += (90 * DEGREES_TO_RADIANS)
      @landscape.scale.set(50, 50, 50)
      @landscape.castShadow = true
      @landscape.receiveShadow = true
      @landscape.position.z += 5
      @landscape.position.x -= 300
      @landscape.position.y += 200
      @game.addToScene(@landscape)
      @levels = json['levels']
      @load(@index)

  hasNextLevel: ->
    @index < @levels.length - 1

  nextLevel: ->
    @index += 1
    @clear()
    @load(@index)

  currentLength: ->
    @length - @OFFSET

  load: (num) ->
    @obstacles = []
    level = @levels[num]
    @length = level.length
    @floor = new Cube(@game, 100, @length + 100, 10, true)
    @floor.setPosition(0, (@length / 2) - @OFFSET, 0)
    @floor.setName('Floor')
    for obstacle in level['obstacles']
      if obstacle.type == 'Low'
        @obstacles.push new Low(@game, obstacle.y, obstacle.lane)
      else if obstacle.type == 'High'
        @obstacles.push new High(@game, obstacle.y, obstacle.lane)

  clear: ->
    for obstacle in @obstacles
      obstacle.destroy()
    @floor.destroy()
