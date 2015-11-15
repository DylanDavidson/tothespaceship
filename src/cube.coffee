class @Cube extends Entity
  constructor: (game, width, length, height) ->
    @geometry = new THREE.BoxGeometry(width, length, height)
    @material = new THREE.MeshPhongMaterial({ color: 0x27ae60 })
    @object = new Physijs.BoxMesh(@geometry, @material, 0)
    @object.receiveShadow = true
    @object.castShadow = true
    game.addToScene(@object)
