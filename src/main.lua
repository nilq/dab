thing = require("project")
local Model = require("model")
local a = 0
do
  local _with_0 = love
  _with_0.load = function()
    point = {
      [1] = 100,
      [2] = 100,
      [3] = 100,
      [4] = 100
    }
    cube = Model("assets/suzanne.obj")
  end
  _with_0.update = function(dt)
    _with_0.window.setTitle(tostring(_with_0.timer.getFPS()))
    a = a + dt
    point[1] = 100 * math.cos(a)
    point[2] = 100 * math.sin(a)
    point[3] = 100 * -math.cos(a)
    point[4] = 100 * -math.sin(a)
  end
  _with_0.draw = function()
    return cube:debug_draw()
  end
  return _with_0
end
