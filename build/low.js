// Generated by CoffeeScript 1.10.0
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  this.Low = (function(superClass) {
    extend(Low, superClass);

    function Low() {
      return Low.__super__.constructor.apply(this, arguments);
    }

    Low.prototype.BASE_Z = 7.5;

    return Low;

  })(this.Obstacle);

}).call(this);