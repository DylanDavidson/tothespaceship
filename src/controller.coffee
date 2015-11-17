class @Controller
  constructor: (game) ->
    @game = game
    window.onkeydown = @onkeydown

  onkeydown: (event) =>
    switch event.keyCode
      when 32, 38
        @game.jump()
      when 40
        @game.slide()
