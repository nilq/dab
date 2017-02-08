export thing = require "project"

Model = require "model"

a = 0

with love
  .load = ->
    export point = {
      [1]: 100
      [2]: 100
      [3]: 100
      [4]: 100
    }

    export cube = Model "assets/suzanne.obj"

  .update = (dt) ->
    .window.setTitle "#{.timer.getFPS!}"

    a += dt

    point[1] = 100 * math.cos a
    point[2] = 100 * math.sin a
    point[3] = 100 * -math.cos a
    point[4] = 100 * -math.sin a

  .draw = ->
    cube\debug_draw!
