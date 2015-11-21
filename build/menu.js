// Generated by CoffeeScript 1.10.0
(function() {
  this.Menu = (function() {
    function Menu(game) {
      this.game = game;
      this.material = new THREE.MeshPhongMaterial({
        color: 0x27ae60
      });
      this.title = new THREE.TextGeometry('To The Spaceship!', {
        size: 20,
        height: 20
      });
      this.title_obj = new THREE.Mesh(this.title, this.material);
      this.title_obj.rotation.x += 100 * DEGREES_TO_RADIANS;
      this.title_obj.position.set(-115, 0, 50);
      this.material = new THREE.MeshPhongMaterial({
        color: 0x27ae60
      });
      this.play = new THREE.TextGeometry('Play', {
        size: 20,
        height: 20
      });
      this.play_obj = new THREE.Mesh(this.play, this.material);
      this.play_obj.rotation.x += 80 * DEGREES_TO_RADIANS;
      this.play_obj.position.set(-22, 0, -50);
      this.play_obj.name = 'Play';
      this.game.addToScene(this.title_obj);
      this.game.addToScene(this.play_obj);
    }

    Menu.prototype.hide = function() {
      this.game.removeFromScene(this.title_obj);
      return this.game.removeFromScene(this.play_obj);
    };

    return Menu;

  })();

}).call(this);