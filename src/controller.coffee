class @Controller
  mouse: new THREE.Vector2()
  raycaster: new THREE.Raycaster()
  last: null
  started: false

  constructor: (game) ->
    @game = game
    window.addEventListener('mousemove', @mousemove)
    window.addEventListener('mousedown', @mousedown)

  update: ->
    return if @started
    if @last != null
      @last.material.materials[0].color.set(Models.play.color)
      @last = null
    @raycaster.setFromCamera(@mouse, @game.base.camera)
    intersects = @raycaster.intersectObjects(@game.base.scene.children)
    return unless intersects.length
    if intersects[0].object.name == 'Play'
      @last = intersects[0].object
      @last.material.materials[0].color.set(0xf1c40f)

  mousedown: =>
    if @last
      @started = true
      @game.start()
      window.onkeydown = @onkeydown
      window.removeEventListener('mousemove', @mousemove)
      window.removeEventListener('mousedown', @mousedown)

  mousemove: (event) =>
    @mouse.x = ( event.clientX / window.innerWidth ) * 2 - 1
    @mouse.y = - ( event.clientY / window.innerHeight ) * 2 + 1

  onkeydown: (event) =>
    switch event.keyCode
      when 32, 38 # Space or Up
        @game.jump()
      when 40 # Down
        @game.slide()
      when 37 # Left
        @game.left()
      when 39 # Right
        @game.right()
