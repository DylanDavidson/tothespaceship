// Generated by CoffeeScript 1.10.0
(function() {
  var ASPECT_RATIO, BLACK, ENABLE_SHADOW_MAPS, FAR_FRUSTRUM, FOV, GRAVITY, GRAY, HEIGHT, LIGHT_COLOR, NEAR_FRUSTRUM, OPAQUE_ALPHA, WHITE, WIDTH;

  BLACK = 0;

  WHITE = 0xFFFFFF;

  GRAY = 0x666666;

  OPAQUE_ALPHA = 1.0;

  LIGHT_COLOR = WHITE;

  WIDTH = window.innerWidth;

  HEIGHT = window.innerHeight;

  FOV = 45;

  ASPECT_RATIO = WIDTH / HEIGHT;

  NEAR_FRUSTRUM = 0.1;

  FAR_FRUSTRUM = 1000;

  ENABLE_SHADOW_MAPS = true;

  GRAVITY = new THREE.Vector3(0, 0, -50);

  this.CAMERA_POSITON = new THREE.Vector3(20, -200, 35);

  this.LOOK_AT_POSITION = new THREE.Vector3(0, 0, 0);

  this.LIGHT_POSITION = new THREE.Vector3(-100, 0, 200);

  this.Base = (function() {
    function Base() {
      this.scene = new Physijs.Scene();
      this.scene.fog = new THREE.Fog(0xffffff, 100, 5000);
      this.scene.fog.color.setHSL(0.6, 0, 1);
      this.renderer = new THREE.WebGLRenderer();
      this.camera = new THREE.PerspectiveCamera(FOV, ASPECT_RATIO, NEAR_FRUSTRUM, FAR_FRUSTRUM);
      this.oc = new THREE.OrbitControls(this.camera);
      this.spotlight = new THREE.DirectionalLight(LIGHT_COLOR, 0.3);
      this.hemilight = new THREE.HemisphereLight(0x2980b9, 0x2ecc71, 0.3);
      this.hemilight.position.set(0, 200, 0);
      this.addToScene(this.hemilight);
      this.sky = Models.sky;
      this.sky_obj = new THREE.Mesh(this.sky.geometry, this.sky.materials);
      this.sky_obj.scale.set(18, 18, 18);
      this.addToScene(this.sky_obj);
      this.scene.setGravity(GRAVITY);
      this.height = window.innerHeight;
      this.width = window.innerWidth;
      this.setupRenderer();
      this.setupCamera();
      this.setupSpotlight();
    }

    Base.prototype.render = function() {
      if (this.player) {
        this.setCameraPosition(CAMERA_POSITON.x, this.player.getPosition().y - 50, CAMERA_POSITON.z);
        this.camera.lookAt(this.player.getPosition());
      }
      this.scene.simulate();
      return this.renderer.render(this.scene, this.camera);
    };

    Base.prototype.addToScene = function(object) {
      return this.scene.add(object);
    };

    Base.prototype.removeFromScene = function(object) {
      return this.scene.remove(object);
    };

    Base.prototype.setCameraPosition = function(x, y, z) {
      return this.camera.position.set(x, y, z);
    };

    Base.prototype.setCameraLook = function(x, y, z) {
      return this.camera.lookAt(new THREE.Vector3(x, y, z));
    };

    Base.prototype.setLightPosition = function(x, y, z) {
      return this.spotlight.position.set(x, y, z);
    };

    Base.prototype.setLightLook = function(x, y, z) {
      return this.spotlight.lookAt(new THREE.Vector3(x, y, z));
    };

    Base.prototype.setupRenderer = function() {
      this.renderer.setClearColor(this.scene.fog.color);
      this.renderer.setSize(WIDTH, HEIGHT);
      this.renderer.shadowMap.enabled = ENABLE_SHADOW_MAPS;
      return document.body.appendChild(this.renderer.domElement);
    };

    Base.prototype.setupCamera = function() {
      this.setCameraPosition(CAMERA_POSITON.x, CAMERA_POSITON.y, CAMERA_POSITON.z);
      this.camera.up = new THREE.Vector3(0, 0, 1);
      this.camera.lookAt(LOOK_AT_POSITION);
      return this.addToScene(this.camera);
    };

    Base.prototype.setupSpotlight = function() {
      this.scene.add(new THREE.AmbientLight(0xecf0f1));
      this.spotlight.color.setHSL(0.1, 1, 0.95);
      this.spotlight.position.set(LIGHT_POSITION.x, LIGHT_POSITION.y, LIGHT_POSITION.z);
      this.spotlight.lookAt(LOOK_AT_POSITION);
      this.spotlight.shadowCameraFar = 1;
      this.spotlight.shadowCameraFar = 2000;
      this.spotlight.shadowMapWidth = 2048;
      this.spotlight.shadowMapHeight = 2048;
      this.spotlight.shadowCameraLeft = -1000;
      this.spotlight.shadowCameraRight = 1000;
      this.spotlight.shadowCameraTop = 1000;
      this.spotlight.shadowCameraBottom = -1000;
      this.helper = new THREE.CameraHelper(this.spotlight.shadow.camera);
      this.addToScene(this.helper);
      this.spotlight.castShadow = true;
      return this.addToScene(this.spotlight);
    };

    Base.prototype.follow = function(object) {
      return this.player = object;
    };

    return Base;

  })();

}).call(this);
