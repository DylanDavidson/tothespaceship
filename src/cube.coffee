class @Cube extends Entity
  constructor: (game, width, length, height) ->
    @geometry = new THREE.BoxGeometry(width, length, height)
    @material = new THREE.MeshPhongMaterial({ color: 0x27ae60 })
    @object = new Physijs.BoxMesh(@geometry, @material, 0)
    @object.receiveShadow = true
    @object.castShadow = true
    game.addToScene(@object)

  moveX: (amount) ->
    @object.__dirtyPosition = true
    @object.position.x += amount

  rotateX: (degrees) ->
    @object.__dirtyRotation = true
    @object.rotation.x += (degrees * DEGREES_TO_RADIANS)

  rotateZ: (degrees) ->
    @object.__dirtyRotation = true
    @object.rotation.z += (degrees * DEGREES_TO_RADIANS)
