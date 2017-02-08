thing = require("project/")
local a = 0
do
  local _with_0 = love
  _with_0.load = function()
    point = {
      [1] = 100,
      [2] = 100,
      [3] = 100
    }
  end
  _with_0.update = function(dt)
    a = a + dt
    point[1] = 100 * math.cos(a)
    point[2] = 100 * math.sin(a)
    point[3] = 100 * -math.cos(a)
  end
  _with_0.draw = function()
    _with_0.graphics.setColor(0, 255, 0)
    return thing.graphics.triangle(250, "fill", {
      point[1],
      200,
      200
    }, {
      200,
      point[2],
      200
    }, {
      200,
      200,
      point[3]
    })
  end
  return _with_0
end
