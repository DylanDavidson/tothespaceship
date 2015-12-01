class @Full extends @Obstacle
  BASE_Z: 5
  SCALE: new THREE.Vector3(5, 5, 5)

  getBoundingBox: ->
    new Cube(@game, 20, 10, 70, true)

  getModel: ->
    Models.tree

  afterCreate: ->
    @rotateX(90)
