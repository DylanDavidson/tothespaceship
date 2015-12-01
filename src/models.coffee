class @Models
  LOADER: new THREE.JSONLoader()
  MODELS_TO_LOAD: 9
  count: 0

  constructor: (game) ->
    @game = game
    @LOADER.load './models/landscape.json', (geometry, materials) =>
      Models.landscape = { geometry: geometry, materials: new THREE.MeshFaceMaterial(materials) }
      for material in Models.landscape.materials.materials
        material.shading = THREE.FlatShading
        material.side = THREE.DoubleSide
      @checkCount()
    @LOADER.load './models/text.json', (geometry, materials) =>
      Models.text = { geometry: geometry, materials: new THREE.MeshFaceMaterial(materials) }
      Models.text.materials.materials[0].shading = THREE.FlatShading
      @checkCount()
    @LOADER.load './models/play.json', (geometry, materials) =>
      Models.play = { geometry: geometry, materials: new THREE.MeshFaceMaterial(materials) }
      Models.play.materials.materials[0].shading = THREE.FlatShading
      Models.play.color = Models.play.materials.materials[0].color.clone()
      @checkCount()
    @LOADER.load './models/sky.json', (geometry, materials) =>
      Models.sky = { geometry: geometry, materials: new THREE.MeshFaceMaterial(materials) }
      Models.sky.materials.materials[0].shading = THREE.FlatShading
      Models.sky.materials.materials[0].side = THREE.DoubleSide
      @checkCount()
    @LOADER.load './models/cloud.json', (geometry, materials) =>
      Models.cloud = { geometry: geometry, materials: new THREE.MeshFaceMaterial(materials) }
      for material in Models.cloud.materials.materials
        material.shading = THREE.FlatShading
      @checkCount()
    @LOADER.load './models/rock.json', (geometry, materials) =>
      Models.rock = { geometry: geometry, materials: new THREE.MeshFaceMaterial(materials) }
      for material in Models.rock.materials.materials
        material.shading = THREE.FlatShading
      @checkCount()
    @LOADER.load './models/tree.json', (geometry, materials) =>
      Models.tree = { geometry: geometry, materials: new THREE.MeshFaceMaterial(materials) }
      for material in Models.tree.materials.materials
        material.shading = THREE.FlatShading
      @checkCount()
    @LOADER.load './models/win.json', (geometry, materials) =>
      Models.rocket = { geometry: geometry, materials: new THREE.MeshFaceMaterial(materials) }
      for material in Models.rocket.materials.materials
        material.shading = THREE.FlatShading
      @checkCount()
    @LOADER.load './models/uptut.json', (geometry, materials) =>
      Models.uptut = { geometry: geometry, materials: new THREE.MeshFaceMaterial(materials) }
      for material in Models.uptut.materials.materials
        material.shading = THREE.FlatShading
      @checkCount()

  checkCount: ->
    @count += 1
    if @count >= @MODELS_TO_LOAD
      window.game = new Game()
      window.render()
