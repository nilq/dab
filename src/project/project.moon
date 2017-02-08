project = (fov, ...) ->
  point = {...}

  scale = fov / (fov + point[#point])

  _point = {}

  for c in *point
    _point[#_point + 1] = c * scale

    if #_point - (#point - 1) == 0
      return _point, scale

project_to = (n, fov, ...) ->
  a, scale = project fov, ...
  switch n - #a
    when 0
      return a, scale
    else
      project_to n, fov, unpack a

draw_line = (fov, p1, p2) ->
  a, s = project_to 2, fov, unpack p1
  a2, s2 = project_to 2, fov, unpack p2

  with love.graphics
    .push!
    .translate 400, 300

    .line a[1] * s, a[2] * s, a2[1] * s2, a2[2] * s2

    .print p1[1] .. ", " .. (p1[2] or "nil") .. ", " .. (p1[3] or "nil") .. ", " .. (p1[4] or "nil") .. ", " .. (p1[5] or "nil"), s * a[1], s * a[2]
    .print p2[1] .. ", " .. (p2[2] or "nil") .. ", " .. (p2[3] or "nil") .. ", " .. (p2[4] or "nil") .. ", " .. (p2[5] or "nil"), s2 * a2[1], s2 * a2[2]

    .pop!

{
  :project
  :project_to
  :draw_line
}
