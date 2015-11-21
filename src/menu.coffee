class @Menu
  constructor: (game) ->
    @game = game
    @material = new THREE.MeshPhongMaterial({ color: 0x27ae60 })
    @title = new THREE.TextGeometry('To The Spaceship!', { size: 20, height: 20 })
    @title_obj = new THREE.Mesh(@title, @material)
    @title_obj.rotation.x += 100 * DEGREES_TO_RADIANS
    @title_obj.position.set(-115, 0, 50)
    @material = new THREE.MeshPhongMaterial({ color: 0x27ae60 })
    @play = new THREE.TextGeometry('Play', { size: 20, height: 20 })
    @play_obj = new THREE.Mesh(@play, @material)
    @play_obj.rotation.x += 80 * DEGREES_TO_RADIANS
    @play_obj.position.set(-22, 0, -50)
    @play_obj.name = 'Play'
    @game.addToScene(@title_obj)
    @game.addToScene(@play_obj)

  hide: ->
    @game.removeFromScene(@title_obj)
    @game.removeFromScene(@play_obj)
