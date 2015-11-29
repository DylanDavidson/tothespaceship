class @Low extends @Obstacle
  MATERIAL: new THREE.MeshPhongMaterial({ color: 0x9CAAC6 })
  BASE_Z: 5
  SCALE: new THREE.Vector3(9, 9, 9)

  getBoudingBox: ->
    new Cube(@game, 20, 8, 15, true)

  getModel: ->
    Models.rock

  afterCreate: ->
    @rotateZ(Math.random() * 90)
