export thing = require "project/project"

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

  .draw = ->
    p, size = thing.project_to 2, 250, point[1], 100, 100, 20, point[2]

    .graphics.circle "fill", 200 + p[1], 200 + p[2], 10 * size

    .graphics.setColor 0, 0, 255
    thing.draw_line 250, {point[1] - 100, -200, 0}, {point[1] - 100, -200, 0}

    .graphics.setColor 0, 255, 255
    thing.draw_line 250, {200, point[1] - 100, 0}, {-200, point[1] - 100, 0}

    .graphics.setColor 0, 255, 0
    thing.draw_line 250, {200, 0, point[1]}, {-200, 0, point[1]}

    .graphics.setColor 255, 0, 0
    thing.draw_line 250, {200, 100, 100, point[1], 0}, {-200, 100, 100, point[1], 100}

    .graphics.setColor 255, 255, 0
    thing.draw_line 250, {200, 300, 100, 0, point[1]}, {-200, 300, 100, 100, point[1]}
