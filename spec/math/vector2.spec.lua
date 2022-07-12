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

      local expected = vector2.create_from_vector2({
        x = vec.x < min.x and min.x or vec.x > max.x and max.x or vec.x,
        y = vec.y < min.y and min.y or vec.y > max.y and max.y or vec.y,
      })

      assert.are.equals(expected.x, clamped.x)
      assert.are.equals(expected.y, clamped.y)
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

describe('metamethod', function()
  it('__tostring', function()
    local x = math.random(100)
    local y = math.random(100)
    local vec = vector2.create_from_xy(x, y)
    local result = tostring(vec)

    assert.are.equals(result, string.format('(%s, %s)', x, y))
  end)

  it('__add', function()
    local x1 = math.random(100)
    local x2 = math.random(100)
    local y1 = math.random(100)
    local y2 = math.random(100)
    local vec1 = vector2.create_from_xy(x1, y1)
    local vec2 = vector2.create_from_xy(x2, y2)

    assert.are.same(vec1 + vec2, {
      x = x1 + x2,
      y = y1 + y2,
    })
  end)

  it('__sub', function()
    local x1 = math.random(100)
    local x2 = math.random(100)
    local y1 = math.random(100)
    local y2 = math.random(100)
    local vec1 = vector2.create_from_xy(x1, y1)
    local vec2 = vector2.create_from_xy(x2, y2)

    assert.are.same(vec1 - vec2, {
      x = x1 - x2,
      y = y1 - y2,
    })
  end)

  it('__mul', function()
    local x1 = math.random(100)
    local x2 = math.random(100)
    local y1 = math.random(100)
    local y2 = math.random(100)
    local vec1 = vector2.create_from_xy(x1, y1)
    local vec2 = vector2.create_from_xy(x2, y2)

    assert.are.same(vec1 * vec2, {
      x = x1 * x2,
      y = y1 * y2,
    })
  end)

  it('__div', function()
    local x1 = math.random(100)
    local x2 = math.random(100)
    local y1 = math.random(100)
    local y2 = math.random(100)
    local vec1 = vector2.create_from_xy(x1, y1)
    local vec2 = vector2.create_from_xy(x2, y2)

    assert.are.same(vec1 / vec2, {
      x = x1 / x2,
      y = y1 / y2,
    })
  end)

  it('__eq', function()
    local x = math.random(100)
    local y = math.random(100)
    local left = vector2.create_from_xy(x, y)
    local right = vector2.create_from_vector2(left)

    assert.are.equals(left, right)
  end)
end)
