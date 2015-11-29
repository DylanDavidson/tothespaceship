class @High extends @Obstacle
  MATERIAL: new THREE.MeshPhongMaterial( { color: 0xbdc3c7, specular: 0xbdc3c7, shininess: 0 } )
  BASE_Z: 24
  SCALE: new THREE.Vector3(7, 7, 7)

  getBoudingBox: ->
    new Cube(@game, 20, 7, 10, true)

  getModel: ->
    Models.cloud

  afterCreate: ->
    @rotateX(Math.random() * 180)
