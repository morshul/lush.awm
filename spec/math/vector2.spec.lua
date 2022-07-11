require('busted.runner')()

local vector2 = require('mathematics.vectors.vector2')

describe('zero vectors are equal', function()
  local expected = { x = 0.0, y = 0.0 }

  it('validate `create_from_xy`', function()
    local complete = vector2.create_from_xy(0.0, 0.0)
    local incomplete = vector2.create_from_xy(0.0)
    local none = vector2.create_from_xy()

    assert.are.same(complete, expected)
    assert.are.same(incomplete, expected)
    assert.are.same(none, expected)
  end)

  it('validate `create_from_value`', function()
    local complete = vector2.create_from_value(0.0)
    local none = vector2.create_from_value()

    assert.are.same(complete, expected)
    assert.are.same(none, expected)
  end)

  it('validate `create_from_vector2`', function()
    local full = vector2.create_from_vector2({ x = 0.0, y = 0.0 })
    local only_x = vector2.create_from_vector2({ x = 0.0 })
    local only_y = vector2.create_from_vector2({ y = 0.0 })

    assert.are.same(full, expected)
    assert.are.same(only_x, expected)
    assert.are.same(only_y, expected)
  end)
end)

describe('clamping', function()
  it(
    'one vector between two other vectors clamps all components between corresponding components',
    function()
      local vec = vector2.create_from_xy(5.6, 2.1)
      local min = vector2.create_from_xy(3.2, 4.2)
      local max = vector2.create_from_xy(7.4, 9.5)
      local clamped = vector2.clamp(vec, min, max)

      local expected_x = vec.x < min.x and min.x
        or vec.x > max.x and max.x
        or vec.x
      local expected_y = vec.y < min.y and min.y
        or vec.y > max.y and max.y
        or vec.y

      assert.are.equals(expected_x, clamped.x)
      assert.are.equals(expected_y, clamped.y)
    end
  )
end)

describe('length', function()
  it('is always >= 0', function()
    local vec = vector2.create_from_value(9.3)

    assert.is_true(vec:length() >= 0.0)
  end)

  it('squared method works', function()
    local x = 43.1
    local y = 5.6

    local vec = vector2.create_from_xy(x, y)
    local squared = x * x + y * y

    assert.are.equals(squared, vec:length_squared())
  end)
end)
