local is_callable
is_callable = function(x)
  return (nil ~= (getmetatable(x)).__call or "function" == type(x))
end
local combine
combine = function(...)
  local _error = "expected either function or nil"
  local n = select("#", ...)
  if n == 0 then
    return noop
  end
  if n == 1 then
    local fn = select(1, ...)
    if not (fn) then
      return noop
    end
    assert((is_callable(fn)), _error)
    return fn
  end
  local funcs = { }
  for i = 1, n do
    local fn = select(i, ...)
    if fn ~= nil then
      assert((is_callable(fn)), _error)
      funcs[#funcs + 1] = fn
    end
  end
  return function(...)
    for _index_0 = 1, #funcs do
      local f = funcs[_index_0]
      f(...)
    end
  end
end
