class @Entity
  setPosition: (x, y, z) ->
    @object.__dirtyPosition = true
    @object.position.set(x, y, z)

  setRotation: (x, y, z) ->
    @object.__dirtyRotation = true
    @object.rotation.set(x, y, z)

  setColor: (color) ->
    @material.color.set(color)

  setMass: (mass) ->
    @object.mass = mass

  setName: (name) ->
    @object.name = name

  destroy: ->
    @game.removeFromScene(@object)

  moveX: (amount) ->
    @object.__dirtyPosition = true
    @object.position.x += amount

  rotateX: (degrees) ->
    @object.__dirtyRotation = true
    @object.rotation.x += (degrees * DEGREES_TO_RADIANS)

  rotateZ: (degrees) ->
    @object.__dirtyRotation = true
    @object.rotation.z += (degrees * DEGREES_TO_RADIANS)

  setScale: (x, y, z) ->
    @object.scale.set(x, y, z)

