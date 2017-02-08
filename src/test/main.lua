thing = require("../project")
do
  local _with_0 = love
  _with_0.load = function()
    local point = {
      [1] = 100,
      [2] = 200,
      [3] = 300,
      [4] = 400
    }
  end
  _with_0.draw = function()
    local p = thing.trans(point, 2)
    return _with_0.graphics.circle("fill", p.x, p.y, 10)
  end
  return _with_0
end
