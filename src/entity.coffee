class @Entity
  setPosition: (x, y, z) ->
    @object.position.set(x, y, z)
    @object.__dirtyPosition = true

  setColor: (color) ->
    @material.color.set(color)

  setMass: (mass) ->
    @object.mass = mass

  setName: (name) ->
    @object.name = name
