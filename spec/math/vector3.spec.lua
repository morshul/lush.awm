require('busted.runner')()

local vector3 = require('mathematics.vectors.vector3')

describe('zero vectors are equal', function()
  local expected = { x = 0.0, y = 0.0, z = 0.0 }

  it('validate `create_from_xyz`', function()
    local complete = vector3.create_from_xyz(0.0, 0.0, 0.0)
    local incomplete = vector3.create_from_xyz(0.0, 0.0)
    local none = vector3.create_from_xyz()

    assert.are.same(complete, expected)
    assert.are.same(incomplete, expected)
    assert.are.same(none, expected)
  end)

  it('validate `create_from_value`', function()
    local complete = vector3.create_from_value(0.0)
    local none = vector3.create_from_value()

    assert.are.same(complete, expected)
    assert.are.same(none, expected)
  end)

  it('validate `create_from_vector3`', function()
    local full = vector3.create_from_vector3({ x = 0.0, y = 0.0 })
    local only_x = vector3.create_from_vector3({ x = 0.0 })
    local only_y = vector3.create_from_vector3({ y = 0.0 })
    local only_z = vector3.create_from_vector3({ z = 0.0 })

    assert.are.same(full, expected)
    assert.are.same(only_x, expected)
    assert.are.same(only_y, expected)
    assert.are.same(only_z, expected)
  end)
end)

describe('clamping', function()
  it(
    'one vector between two other vectors clamps all components between corresponding components',
    function()
      local vec = vector3.create_from_xyz(5.6, 2.1, 7.3)
      local min = vector3.create_from_xyz(3.2, 4.2, 1.5)
      local max = vector3.create_from_xyz(7.4, 9.5, 10.4)
      local clamped = vector3.clamp(vec, min, max)

      local expected = vector3.create_from_vector3({
        x = vec.x < min.x and min.x or vec.x > max.x and max.x or vec.x,
        y = vec.y < min.y and min.y or vec.y > max.y and max.y or vec.y,
        z = vec.z < min.z and min.z or vec.x > max.z and max.z or vec.z,
      })

      assert.are.equals(expected.x, clamped.x)
      assert.are.equals(expected.y, clamped.y)
      assert.are.equals(expected.z, clamped.z)
    end
  )
end)

describe('length', function()
  it('is always >= 0', function()
    local vec = vector3.create_from_value(9.3)

    assert.is_true(vec:length() >= 0.0)
  end)

  it('squared method works', function()
    local x = 43.1
    local y = 5.6
    local z = 9.599

    local vec = vector3.create_from_xyz(x, y, z)
    local squared = x * x + y * y + z * z

    assert.are.equals(squared, vec:length_squared())
  end)
end)

describe('metamethod', function()
  it('__tostring', function()
    local x = math.random(100)
    local y = math.random(100)
    local z = math.random(100)
    local vec = vector3.create_from_xyz(x, y, z)
    local result = tostring(vec)

    assert.are.equals(result, string.format('(%s, %s, %s)', x, y, z))
  end)

  it('__add', function()
    local x1 = math.random(100)
    local x2 = math.random(100)
    local y1 = math.random(100)
    local y2 = math.random(100)
    local z1 = math.random(100)
    local z2 = math.random(100)
    local vec1 = vector3.create_from_xyz(x1, y1, z1)
    local vec2 = vector3.create_from_xyz(x2, y2, z2)

    assert.are.same(vec1 + vec2, {
      x = x1 + x2,
      y = y1 + y2,
      z = z1 + z2,
    })
  end)

  it('__sub', function()
    local x1 = math.random(100)
    local x2 = math.random(100)
    local y1 = math.random(100)
    local y2 = math.random(100)
    local z1 = math.random(100)
    local z2 = math.random(100)
    local vec1 = vector3.create_from_xyz(x1, y1, z1)
    local vec2 = vector3.create_from_xyz(x2, y2, z2)

    assert.are.same(vec1 - vec2, {
      x = x1 - x2,
      y = y1 - y2,
      z = z1 - z2,
    })
  end)

  it('__mul', function()
    local x1 = math.random(100)
    local x2 = math.random(100)
    local y1 = math.random(100)
    local y2 = math.random(100)
    local z1 = math.random(100)
    local z2 = math.random(100)
    local vec1 = vector3.create_from_xyz(x1, y1, z1)
    local vec2 = vector3.create_from_xyz(x2, y2, z2)

    assert.are.same(vec1 * vec2, {
      x = x1 * x2,
      y = y1 * y2,
      z = z1 * z2,
    })
  end)

  it('__div', function()
    local x1 = math.random(100)
    local x2 = math.random(100)
    local y1 = math.random(100)
    local y2 = math.random(100)
    local z1 = math.random(100)
    local z2 = math.random(100)
    local vec1 = vector3.create_from_xyz(x1, y1, z1)
    local vec2 = vector3.create_from_xyz(x2, y2, z2)

    assert.are.same(vec1 / vec2, {
      x = x1 / x2,
      y = y1 / y2,
      z = z1 / z2,
    })
  end)

  it('__eq', function()
    local x = math.random(100)
    local y = math.random(100)
    local z = math.random(100)
    local left = vector3.create_from_xyz(x, y, z)
    local right = vector3.create_from_vector3(left)

    assert.are.equals(left, right)
  end)
end)
