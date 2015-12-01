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
FAR_FRUSTRUM = 5000

# 3D Graphics
ENABLE_SHADOW_MAPS = true

# Physics
GRAVITY = new THREE.Vector3(0, 0, -50)

# Positions
@CAMERA_POSITON = new THREE.Vector3(20, -200, 20)
@LOOK_AT_POSITION = new THREE.Vector3(0, 0, 0)
@LIGHT_POSITION = new THREE.Vector3(-700, 0, 700)

class @Base
  constructor: ->
    @scene = new Physijs.Scene()
    @scene.fog = new THREE.Fog(0xffffff, 100, 3000)
    @scene.fog.color.setHSL(0.6, 0, 1)
    @renderer = new THREE.WebGLRenderer()
    @camera = new THREE.PerspectiveCamera(FOV, ASPECT_RATIO, NEAR_FRUSTRUM, FAR_FRUSTRUM)
    @oc = new THREE.OrbitControls(@camera)
    @spotlight = new THREE.DirectionalLight(LIGHT_COLOR, 0.3)
    @hemilight = new THREE.HemisphereLight( 0x2980b9, 0x2ecc71, 0.3 )
    @hemilight.position.set( 0, 200, 0 )
    @addToScene( @hemilight )
    @sky = Models.sky
    @sky_obj = new THREE.Mesh(@sky.geometry, @sky.materials)
    @sky_obj.scale.set(30, 30, 30)
    @addToScene(@sky_obj)

    @scene.setGravity(GRAVITY)

    @height = window.innerHeight
    @width = window.innerWidth

    @setupRenderer()
    @setupCamera()
    @setupSpotlight()

  # Called every frame, updates the scene and simulates the physics
  render: ->
    if @player
      @setCameraPosition(CAMERA_POSITON.x, @player.getPosition().y - 50, CAMERA_POSITON.z)
      @camera.lookAt(@player.getPosition())
    @scene.simulate()
    @renderer.render(@scene, @camera)

  # Adds given object to scene
  addToScene: (object) ->
    @scene.add(object)

  removeFromScene: (object) ->
    @scene.remove(object)

  setCameraPosition: (x, y, z) ->
    @camera.position.set(x, y, z)

  setCameraLook: (x, y, z) ->
    @camera.lookAt(new THREE.Vector3(x, y, z))

  setLightPosition: (x, y, z) ->
    @spotlight.position.set(x, y, z)

  setLightLook: (x, y, z) ->
    @spotlight.lookAt(new THREE.Vector3(x, y, z))

  setupRenderer: ->
    @renderer.setClearColor(@scene.fog.color)
    @renderer.setSize(WIDTH, HEIGHT)
    @renderer.shadowMap.enabled = ENABLE_SHADOW_MAPS
    document.body.appendChild(@renderer.domElement)

  setupCamera: ->
    @setCameraPosition(CAMERA_POSITON.x, CAMERA_POSITON.y, CAMERA_POSITON.z)
    @camera.up = new THREE.Vector3(0, 0, 1)
    @camera.lookAt(LOOK_AT_POSITION)
    @addToScene(@camera)

  setupSpotlight: ->
    @scene.add(new THREE.AmbientLight(0xecf0f1))

    @spotlight.color.setHSL(0.1, 1, 0.95)
    @spotlight.position.set(LIGHT_POSITION.x, LIGHT_POSITION.y, LIGHT_POSITION.z)
    @spotlight.lookAt(LOOK_AT_POSITION)
    @spotlight.shadowCameraFar = 1
    @spotlight.shadowCameraFar = 2000
    @spotlight.shadowMapWidth = 2048
    @spotlight.shadowMapHeight = 2048
    @spotlight.shadowCameraLeft = -1000
    @spotlight.shadowCameraRight = 1000
    @spotlight.shadowCameraTop = 1000
    @spotlight.shadowCameraBottom = -1000
    # @helper = new THREE.CameraHelper(@spotlight.shadow.camera)
    # @addToScene(@helper)
    @spotlight.castShadow = true
    @addToScene(@spotlight)

  follow: (object) ->
    @player = object
