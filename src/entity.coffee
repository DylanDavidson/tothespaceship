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
