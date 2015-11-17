class @Player
  BASE_Z: 12.5
  START: new THREE.Vector3(0, -150, 12.5)
  onGround: true
  sliding: false
  rotateDown: false
  rotateUp: false

  constructor: (game) ->
    @cube = new Cube(game, 10, 10, 15)
    @cube.setColor(0xbdc3c7)
    @cube.setPosition(@START.x, @START.y, @START.z)
    @cube.setMass(1)
    @cube.setName('Player')

  update: =>
    if @rotateDown
      @slideDown()
    else if @rotateUp
      @slideUp()
    position = @cube.object.position
    @onGround = position.z <= @BASE_Z
    @cube.setPosition(position.x, position.y + 1, position.z)

  jump: ->
    if @sliding
      @sliding = false
      @rotateUp = true
      return
    return unless @onGround
    @cube.object.applyCentralImpulse(new THREE.Vector3(0, 0, 30))

  startSlide: ->
    unless @sliding || @rotateDown || @rotateUp
      @rotateDown = true

  slideDown: =>
    if @cube.object.rotation.x >= (90 * DEGREES_TO_RADIANS)
      @rotateDown = false
      @sliding = true
      return
    @cube.object.__dirtyRotation = true
    @cube.object.rotation.x += (3 * DEGREES_TO_RADIANS)

  slideUp: =>
    if @cube.object.rotation.x <= (0 * DEGREES_TO_RADIANS)
      @rotateUp = false
      return
    @cube.object.__dirtyRotation = true
    @cube.object.rotation.x -= (3 * DEGREES_TO_RADIANS)

  reset: ->
    @cube.setPosition(@START.x, @START.y, @START.z)

  getObject: ->
    @cube.object

  getPosition: ->
    @cube.object.position
