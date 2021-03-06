// Generated by CoffeeScript 1.10.0
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  this.Full = (function(superClass) {
    extend(Full, superClass);

    function Full() {
      return Full.__super__.constructor.apply(this, arguments);
    }

    Full.prototype.BASE_Z = 5;

    Full.prototype.SCALE = new THREE.Vector3(5, 5, 5);

    Full.prototype.getBoundingBox = function() {
      return new Cube(this.game, 20, 10, 70, true);
    };

    Full.prototype.getModel = function() {
      return Models.tree;
    };

    Full.prototype.afterCreate = function() {
      return this.rotateX(90);
    };

    return Full;

  })(this.Obstacle);

}).call(this);
