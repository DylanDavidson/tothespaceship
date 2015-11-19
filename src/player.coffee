class @Player
  BASE_Z: 12.5
  START: new THREE.Vector3(0, -150, 12.5)
  onGround: true
  sliding: false
  rotateDown: false
  rotateUp: false
  movingLeft: false
  movingRight: false
  left: false
  right: false
  center: true
  noJump: false

  constructor: (game) ->
    @cube = new Cube(game, 10, 10, 15)
    @cube.setColor(0xbdc3c7)
    @cube.setPosition(@START.x, @START.y, @START.z)
    @cube.setMass(1)
    @cube.setName('Player')
    @cube.object.addEventListener('collision', @collision)

  update: =>
    if @rotateDown
      @slideDown()
    else if @rotateUp
      @slideUp()
    else if @movingLeft
      @moveLeft()
    else if @movingRight
      @moveRight()
    position = @cube.object.position
    @cube.setPosition(position.x, position.y + 1, position.z)

  collision: (other) =>
    if other.name == 'Floor'
      @onGround = true

  jump: ->
    return if !@onGround || @inAction()
    if @sliding
      @sliding = false
      @rotateUp = true
      @onGround = false
    else
      return if @noJump
      @onGround = false
      @noJump = true
      @cube.object.applyCentralImpulse(new THREE.Vector3(0, 0, 30))
      timeout 1000, =>
        @noJump = false

  inAction: ->
    @rotateDown || @rotateUp || @movingLeft || @movingRight

  startSlide: ->
    unless @inAction()
      @rotateDown = true

  startLeft: ->
    unless @inAction() || @left
      @movingLeft = true

  startLeft: ->
    unless @inAction() || @left
      @movingLeft = true

  startRight: ->
    unless @inAction() || @right
      @movingRight = true

  moveRight: ->
    if @center
      if @cube.object.position.x >= 20.0
        @movingRight = false
        @right = true
        @center = false
        return
    else if @left
      if @cube.object.position.x >= 0.0
        @movingRight = false
        @center = true
        @left = false
        return
    @cube.moveX(0.5)
    @cube.rotateZ(-2.25)

  moveLeft: ->
    if @center
      if @cube.object.position.x <= -20
        @movingLeft = false
        @left = true
        @center = false
        return
    else if @right
      if @cube.object.position.x <= 0
        @movingLeft = false
        @center = true
        @right = false
        return
    @cube.moveX(-0.5)
    @cube.rotateZ(2.25)

  slideDown: =>
    if @cube.object.rotation.x >= (90 * DEGREES_TO_RADIANS)
      @rotateDown = false
      @sliding = true
      @onGround = true
      return
    @cube.rotateX(3)

  slideUp: =>
    if @cube.object.rotation.x <= (0 * DEGREES_TO_RADIANS)
      @rotateUp = false
      @onGround = true
      return
    @cube.rotateX(-3)

  reset: ->
    @cube.setPosition(@START.x, @START.y, @START.z)
    @cube.setRotation(0, 0, 0)
    @center = true
    @left = false
    @right = false
    @movingRight = false
    @movingLeft = false
    @sliding = false
    @rotateUp = false
    @rotateDown = false

  getObject: ->
    @cube.object

  getPosition: ->
    @cube.object.position
