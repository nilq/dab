export thing = require "project/"

a = 0

with love
  .load = ->
    export point = {
      [1]: 100
      [2]: 100
      [3]: 100
    }

  .update = (dt) ->
    a += dt

    point[1] = 100 * math.cos a
    point[2] = 100 * math.sin a
    point[3] = 100 * -math.cos a

  .draw = ->
    .graphics.setColor 0, 255, 0
    thing.graphics.triangle 250, "fill", {point[1], 200, 200}, {200, point[2], 200}, {200, 200, point[3]}
