class @Models
  LOADER: new THREE.JSONLoader()
  OBJ_LOADER: new THREE.ObjectLoader()
  MODELS_TO_LOAD: 5
  count: 0

  constructor: (game) ->
    @game = game
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
    @LOADER.load './models/cloud.json', (geometry) =>
      Models.cloud = geometry
      @checkCount()
    @LOADER.load './models/rock.json', (geometry) =>
      Models.rock = geometry
      @checkCount()

  checkCount: ->
    @count += 1
    if @count >= @MODELS_TO_LOAD
      window.game = new Game()
      window.render()
