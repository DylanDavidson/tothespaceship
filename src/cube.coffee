class @Cube extends @Entity
  constructor: (game, width, length, height, transparent = false) ->
    @game = game
    @geometry = new THREE.BoxGeometry(width, length, height)
    @material = new THREE.MeshPhongMaterial({ color: 0x27ae60, shininess: 0, transparent: transparent })
    if transparent
      @material.opacity = 0
    @object = new Physijs.BoxMesh(@geometry, @material, 0)
    @object.receiveShadow = true
    @object.castShadow = true
    @game.addToScene(@object)
