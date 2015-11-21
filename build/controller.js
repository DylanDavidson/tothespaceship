// Generated by CoffeeScript 1.10.0
(function() {
  var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.Controller = (function() {
    Controller.prototype.mouse = new THREE.Vector2();

    Controller.prototype.raycaster = new THREE.Raycaster();

    Controller.prototype.last = null;

    Controller.prototype.OLD_COLOR = 0x27ae60;

    Controller.prototype.started = false;

    function Controller(game) {
      this.onkeydown = bind(this.onkeydown, this);
      this.mousemove = bind(this.mousemove, this);
      this.mousedown = bind(this.mousedown, this);
      this.game = game;
      window.addEventListener('mousemove', this.mousemove);
      window.addEventListener('mousedown', this.mousedown);
    }

    Controller.prototype.update = function() {
      var intersects;
      if (this.started) {
        return;
      }
      if (this.last !== null) {
        this.last.material.color.set(this.OLD_COLOR);
        this.last = null;
      }
      this.raycaster.setFromCamera(this.mouse, this.game.base.camera);
      intersects = this.raycaster.intersectObjects(this.game.base.scene.children);
      if (!intersects.length) {
        return;
      }
      if (intersects[0].object.name === 'Play') {
        this.last = intersects[0].object;
        return this.last.material.color.set(0xf1c40f);
      }
    };

    Controller.prototype.mousedown = function() {
      if (this.last) {
        this.started = true;
        this.game.start();
        window.onkeydown = this.onkeydown;
        window.removeEventListener('mousemove', this.mousemove);
        return window.removeEventListener('mousedown', this.mousedown);
      }
    };

    Controller.prototype.mousemove = function(event) {
      this.mouse.x = (event.clientX / window.innerWidth) * 2 - 1;
      return this.mouse.y = -(event.clientY / window.innerHeight) * 2 + 1;
    };

    Controller.prototype.onkeydown = function(event) {
      switch (event.keyCode) {
        case 32:
        case 38:
          return this.game.jump();
        case 40:
          return this.game.slide();
        case 37:
          return this.game.left();
        case 39:
          return this.game.right();
      }
    };

    return Controller;

  })();

}).call(this);
