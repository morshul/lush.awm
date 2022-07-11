require('busted.runner')()

local vector4 = require('mathematics.vectors.vector4')

describe('zero vectors are equal', function()
  local expected = { x = 0.0, y = 0.0, z = 0.0, w = 0.0 }

  it('validate `create_from_xyzw`', function()
    local complete = vector4.create_from_xyzw(0.0, 0.0, 0.0, 0.0)
    local incomplete = vector4.create_from_xyzw(0.0, 0.0, 0.0)
    local none = vector4.create_from_xyzw()

    assert.are.same(complete, expected)
    assert.are.same(incomplete, expected)
    assert.are.same(none, expected)
  end)

  it('validate `create_from_value`', function()
    local complete = vector4.create_from_value(0.0)
    local none = vector4.create_from_value()

    assert.are.same(complete, expected)
    assert.are.same(none, expected)
  end)

  it('validate `create_from_vector4`', function()
    local full =
      vector4.create_from_vector4({ x = 0.0, y = 0.0, z = 0.0, w = 0.0 })
    local only_x = vector4.create_from_vector4({ x = 0.0 })
    local only_y = vector4.create_from_vector4({ y = 0.0 })
    local only_z = vector4.create_from_vector4({ z = 0.0 })
    local only_w = vector4.create_from_vector4({ w = 0.0 })

    assert.are.same(full, expected)
    assert.are.same(only_x, expected)
    assert.are.same(only_y, expected)
    assert.are.same(only_z, expected)
    assert.are.same(only_w, expected)
  end)
end)

describe('clamping', function()
  it(
    'one vector between two other vectors clamps all components between corresponding components',
    function()
      local vec = vector4.create_from_xyzw(5.6, 2.1, 7.3)
      local min = vector4.create_from_xyzw(3.2, 4.2, 1.5)
      local max = vector4.create_from_xyzw(7.4, 9.5, 10.4)
      local clamped = vector4.clamp(vec, min, max)

      local expected_x = vec.x < min.x and min.x
        or vec.x > max.x and max.x
        or vec.x
      local expected_y = vec.y < min.y and min.y
        or vec.y > max.y and max.y
        or vec.y
      local expected_z = vec.z < min.z and min.z
        or vec.z > max.z and max.z
        or vec.z
      local expected_w = vec.w < min.w and min.w
        or vec.w > max.w and max.w
        or vec.w

      assert.are.equals(expected_x, clamped.x)
      assert.are.equals(expected_y, clamped.y)
      assert.are.equals(expected_z, clamped.z)
      assert.are.equals(expected_w, clamped.w)
    end
  )
end)

describe('length', function()
  it('is always >= 0', function()
    local vec = vector4.create_from_value(9.3)

    assert.is_true(vec:length() >= 0.0)
  end)

  it('squared method works', function()
    local x = 43.1
    local y = 5.6
    local z = 9.599
    local w = 32.54

    local vec = vector4.create_from_xyzw(x, y, z, w)
    local squared = x * x + y * y + z * z + w * w

    assert.are.equals(squared, vec:length_squared())
  end)
end)
