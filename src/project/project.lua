local project
project = function(fov, ...)
  local point = {
    ...
  }
  local scale = fov / (fov + point[#point])
  local _point = { }
  for _index_0 = 1, #point do
    local c = point[_index_0]
    _point[#_point + 1] = c * scale
    if #_point - (#point - 1) == 0 then
      return _point, scale
    end
  end
end
local project_to
project_to = function(n, fov, ...)
  local a, scale = project(fov, ...)
  local _exp_0 = n - #a
  if 0 == _exp_0 then
    return a, scale
  else
    return project_to(n, fov, unpack(a))
  end
end
local draw_line
draw_line = function(fov, p1, p2)
  local a, s = project_to(2, fov, unpack(p1))
  local a2, s2 = project_to(2, fov, unpack(p2))
  do
    local _with_0 = love.graphics
    _with_0.push()
    _with_0.translate(400, 300)
    _with_0.line(a[1] * s, a[2] * s, a2[1] * s2, a2[2] * s2)
    _with_0.print(p1[1] .. ", " .. (p1[2] or "nil") .. ", " .. (p1[3] or "nil") .. ", " .. (p1[4] or "nil") .. ", " .. (p1[5] or "nil"), s * a[1], s * a[2])
    _with_0.print(p2[1] .. ", " .. (p2[2] or "nil") .. ", " .. (p2[3] or "nil") .. ", " .. (p2[4] or "nil") .. ", " .. (p2[5] or "nil"), s2 * a2[1], s2 * a2[2])
    _with_0.pop()
    return _with_0
  end
end
return {
  project = project,
  project_to = project_to,
  draw_line = draw_line
}
