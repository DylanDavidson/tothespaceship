class @Low extends @Obstacle
  BASE_Z: 5
  SCALE: new THREE.Vector3(9, 9, 9)

  getBoundingBox: ->
    new Cube(@game, 20, 8, 15, true)

  getModel: ->
    Models.rock

  afterCreate: ->
    @rotateZ(Math.random() * 90)
