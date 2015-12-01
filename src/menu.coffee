class @Menu
  CLOUDS: [
    new THREE.Vector3(-70, 0, 50),
    new THREE.Vector3(80, 0, 50),
    new THREE.Vector3(-150, 0, 0),
    new THREE.Vector3(160, 0, 10),
    new THREE.Vector3(-70, 0, -50),
    new THREE.Vector3(-180, 0, -80),
    new THREE.Vector3(-140, 0, 80),
    new THREE.Vector3(170, 0, 80),
    new THREE.Vector3(130, 0, -50),
    new THREE.Vector3(200, 0, -100),
  ]

  constructor: (game) ->
    @game = game
    @text = Models.text
    @text_obj = new THREE.Mesh(@text.geometry, @text.materials)
    @text_obj.scale.set(15, 15, 15)
    @text_obj.rotation.x += (90 * DEGREES_TO_RADIANS)
    @text_obj.receiveShadow = true
    @text_obj.castShadow = true
    @clouds = []
    for cloud in @CLOUDS
      obj = new THREE.Mesh(Models.cloud.geometry, Models.cloud.materials)
      obj.scale.set(15, 15, 15)
      obj.position.set(cloud.x, cloud.y, cloud.z)
      obj.rotation.x += (Math.random() * 90) * DEGREES_TO_RADIANS
      obj.rotation.z += (Math.random() * 15) * DEGREES_TO_RADIANS
      @clouds.push(obj)
      @game.addToScene(obj)

    @play = Models.play
    @play_obj = new THREE.Mesh(@play.geometry, @play.materials)
    @play_obj.scale.set(15, 15, 15)
    @play_obj.rotation.x += (90 * DEGREES_TO_RADIANS)
    @play_obj.receiveShadow = true
    @play_obj.castShadow = true
    @play_obj.name = 'Play'

    @game.addToScene(@text_obj)
    @game.addToScene(@play_obj)

  hide: ->
    @game.removeFromScene(@text_obj)
    @game.removeFromScene(@play_obj)
    for cloud in @clouds
      @game.removeFromScene(cloud)
