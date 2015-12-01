class @Obstacle extends @Entity
  COLOR: 0x95a5a6
  LANES: {
    0: -20,
    1: 0,
    2: 20,
  }

  constructor: (game, y, lane) ->
    @game = game
    @model = @getModel()
    @object = new THREE.Mesh(@model.geometry, @model.materials)
    @object.castShadow = true
    @object.receiveShadow = true
    @bounding_box = @getBoundingBox()
    @game.addToScene(@object)
    @bounding_box.setPosition(@LANES[lane], y, @BASE_Z)
    @setPosition(@LANES[lane], y, @BASE_Z)
    @setScale(@SCALE.x, @SCALE.y, @SCALE.z)
    @bounding_box.object.addEventListener('collision', @collision)
    @afterCreate()

  collision: (other) =>
    if other.name == 'Player'
      @game.reset()

  destroy: ->
    @game.removeFromScene(@object)
    @bounding_box.destroy()
