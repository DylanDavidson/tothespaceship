// Generated by CoffeeScript 1.10.0
(function() {
  this.Models = (function() {
    Models.prototype.LOADER = new THREE.JSONLoader();

    Models.prototype.OBJ_LOADER = new THREE.ObjectLoader();

    Models.prototype.MODELS_TO_LOAD = 5;

    Models.prototype.count = 0;

    function Models(game) {
      this.game = game;
      this.LOADER.load('./models/text.json', (function(_this) {
        return function(geometry, materials) {
          Models.text = {
            geometry: geometry,
            materials: new THREE.MeshFaceMaterial(materials)
          };
          Models.text.materials.materials[0].shading = THREE.FlatShading;
          return _this.checkCount();
        };
      })(this));
      this.LOADER.load('./models/play.json', (function(_this) {
        return function(geometry, materials) {
          Models.play = {
            geometry: geometry,
            materials: new THREE.MeshFaceMaterial(materials)
          };
          Models.play.materials.materials[0].shading = THREE.FlatShading;
          Models.play.color = Models.play.materials.materials[0].color.clone();
          return _this.checkCount();
        };
      })(this));
      this.LOADER.load('./models/sky.json', (function(_this) {
        return function(geometry, materials) {
          Models.sky = {
            geometry: geometry,
            materials: new THREE.MeshFaceMaterial(materials)
          };
          Models.sky.materials.materials[0].shading = THREE.FlatShading;
          Models.sky.materials.materials[0].side = THREE.DoubleSide;
          return _this.checkCount();
        };
      })(this));
      this.LOADER.load('./models/cloud.json', (function(_this) {
        return function(geometry) {
          Models.cloud = geometry;
          return _this.checkCount();
        };
      })(this));
      this.LOADER.load('./models/rock.json', (function(_this) {
        return function(geometry) {
          Models.rock = geometry;
          return _this.checkCount();
        };
      })(this));
    }

    Models.prototype.checkCount = function() {
      this.count += 1;
      if (this.count >= this.MODELS_TO_LOAD) {
        window.game = new Game();
        return window.render();
      }
    };

    return Models;

  })();

}).call(this);
