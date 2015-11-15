# Dylan Davidson
# Final Project - CAP 4270

## Colors
BLACK = 0
WHITE = 0xFFFFFF
GRAY = 0x666666
OPAQUE_ALPHA = 1.0
LIGHT_COLOR = WHITE

## Dimensions
WIDTH = window.innerWidth
HEIGHT = window.innerHeight
FOV = 45
ASPECT_RATIO = WIDTH / HEIGHT
NEAR_FRUSTRUM = 0.1
FAR_FRUSTRUM = 1000

# 3D Graphics
ENABLE_SHADOW_MAPS = true

# Physics
GRAVITY = new THREE.Vector3(0, 0, -50)

# Positions
CAMERA_POSITON = new THREE.Vector3(0, -200, 50)
LOOK_AT_POSITION = new THREE.Vector3(0, 0, 0)
LIGHT_POSITION = new THREE.Vector3(-30, -200, 50)

class @Base
  constructor: ->
    @scene = new Physijs.Scene()
    @renderer = new THREE.WebGLRenderer()
    @camera = new THREE.PerspectiveCamera(FOV, ASPECT_RATIO, NEAR_FRUSTRUM, FAR_FRUSTRUM)
    @spotlight = new THREE.SpotLight(LIGHT_COLOR)

    @scene.setGravity(GRAVITY)

    @height = window.innerHeight
    @width = window.innerWidth

    @setupRenderer()
    @setupCamera()
    @setupSpotlight()

  # Called every frame, updates the scene and simulates the physics
  render: ->
    if @player
      @setCameraPosition(CAMERA_POSITON.x, @player.position.y - 50, CAMERA_POSITON.z)
      @camera.lookAt(@player.position)
    @scene.simulate()
    @renderer.render(@scene, @camera)

  # Adds given object to scene
  addToScene: (object) ->
    @scene.add(object)

  removeFromScene: (object) ->
    @scene.remove(object)

  setCameraPosition: (x, y, z) ->
    @camera.position.set(x, y, z)

  setupRenderer: ->
    @renderer.setClearColor(BLACK, OPAQUE_ALPHA)
    @renderer.setSize(WIDTH, HEIGHT)
    @renderer.shadowMapEnabled = ENABLE_SHADOW_MAPS
    document.body.appendChild(@renderer.domElement)

  setupCamera: ->
    @setCameraPosition(CAMERA_POSITON.x, CAMERA_POSITON.y, CAMERA_POSITON.z)
    @camera.up = new THREE.Vector3(0, 0, 1)
    @camera.lookAt(LOOK_AT_POSITION)
    @addToScene(@camera)

  setupSpotlight: ->
    @scene.add(new THREE.AmbientLight(0xecf0f1))

    @spotlight.position.set(LIGHT_POSITION.x, LIGHT_POSITION.y, LIGHT_POSITION.z)
    @spotlight.lookAt(LOOK_AT_POSITION)
    @spotlight.shadowCameraNear = 20
    @spotlight.shadowCameraFar = 500
    @spotlight.shadowDarkness = 0.5
    @spotlight.castShadow = true
    @addToScene(@spotlight)

  follow: (object) ->
    @player = object
