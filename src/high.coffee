class @High extends @Obstacle
  BASE_Z: 24
  SCALE: new THREE.Vector3(7, 7, 7)

  getBoundingBox: ->
    new Cube(@game, 20, 7, 10, true)

  getModel: ->
    Models.cloud

  afterCreate: ->
    @rotateX(Math.random() * 180)
