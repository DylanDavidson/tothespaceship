class @Controller
  constructor: (game) ->
    @game = game
    window.onkeydown = @onkeydown

  onkeydown: (event) =>
    switch event.keyCode
      when 32, 38 # Space or Up
        @game.jump()
      when 40 # Down
        @game.slide()
      when 37 # Left
        @game.left()
      when 39 # Right
        @game.right()
