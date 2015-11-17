// Generated by CoffeeScript 1.10.0
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  this.Cube = (function(superClass) {
    extend(Cube, superClass);

    function Cube(game, width, length, height) {
      this.geometry = new THREE.BoxGeometry(width, length, height);
      this.material = new THREE.MeshPhongMaterial({
        color: 0x27ae60
      });
      this.object = new Physijs.BoxMesh(this.geometry, this.material, 0);
      this.object.receiveShadow = true;
      this.object.castShadow = true;
      game.addToScene(this.object);
    }

    Cube.prototype.moveX = function(amount) {
      this.object.__dirtyPosition = true;
      return this.object.position.x += amount;
    };

    Cube.prototype.rotateX = function(degrees) {
      this.object.__dirtyRotation = true;
      return this.object.rotation.x += degrees * DEGREES_TO_RADIANS;
    };

    Cube.prototype.rotateZ = function(degrees) {
      this.object.__dirtyRotation = true;
      return this.object.rotation.z += degrees * DEGREES_TO_RADIANS;
    };

    return Cube;

  })(Entity);

}).call(this);
