class @Player
  BASE_Z: 12.5
  onGround: true

  constructor: (game) ->
    @cube = new Cube(game, 10, 10, 15)
    @cube.setColor(0xbdc3c7)
    @cube.setPosition(0, -150, @BASE_Z)
    @cube.setMass(1)

  update: =>
    position = @cube.object.position
    @onGround = position.z <= @BASE_Z
    @cube.setPosition(position.x, position.y + 1, position.z)

  jump: ->
    return unless @onGround
    @cube.object.applyCentralImpulse(new THREE.Vector3(0, 0, 30))

  getObject: ->
    @cube.object
