local vector4 = {}

---Represents a 4D vector using four high-precision numbers.
--- @class lush.Mathematics.Vector4
--- @field x number The X component of the `Vector4`
--- @field y number The Y component of the `Vector4`
--- @field z number The Z component of the `Vector4`
--- @field w number The W component of the `Vector4`
local Vector4 = setmetatable({}, {
  __index = {
    x = 0.0,
    y = 0.0,
    z = 0.0,
    w = 0.0,
  },
})

--[[
    VECTOR4 CONSTRUCTOR
]]

---Initializes a new instance of the `Vector4` struct.
---
--- @param x? number The X coordinate of the `Vector4`.
--- @param y? number The Y coordinate of the `Vector4`.
--- @param z? number The Z coordinate of the `Vector4`.
--- @param w? number The W coordinate of the `Vector4`
---
--- @return lush.Mathematics.Vector4 result Result of operation.
vector4.create_from_xyzw = function(x, y, z, w)
  local result = setmetatable({}, {
    __index = Vector4,
  })

  result.x = x or 0.0
  result.y = y or 0.0
  result.z = z or 0.0
  result.w = w or 0.0

  return result
end

---Initializes a new instance of the `Vector4` struct.
---
--- @param value? number The value that will initialize this instance.
---
--- @return lush.Mathematics.Vector4 result Result of operation.
vector4.create_from_value = function(value)
  local result = setmetatable({}, {
    __index = Vector4,
  })

  result.x = value or 0.0
  result.y = value or 0.0
  result.z = value or 0.0
  result.w = value or 0.0

  return result
end

---Initializes a new instance of the `Vector4` struct.
---
--- @param vector? lush.Mathematics.Vector4
---
--- @return lush.Mathematics.Vector4 result Result of operation.
vector4.create_from_vector4 = function(vector)
  local result = setmetatable({}, {
    __index = Vector4,
  })

  if vector ~= nil then
    result.x = vector.x or 0.0
    result.y = vector.y or 0.0
    result.z = vector.z or 0.0
    result.w = vector.z or 0.0
  end

  return result
end

---Deconstructs the vector into it's individual components.
---
--- @param vec lush.Mathematics.Vector4
---
--- @return number x The X component of the vector.
--- @return number y The Y component of the vector.
--- @return number z The Z component of the vector.
--- @return number w The W component of the vector.
vector4.deconstruct = function(vec)
  local result = setmetatable({}, {
    __index = vec,
  })

  return result.x, result.y, result.z, result.w
end

--[[
    VECTOR4 STATIC METHODS
]]

---Adds two vectors.
---
--- @param left lush.Mathematics.Vector4 Left operand.
--- @param right lush.Mathematics.Vector4 Right operand.
---
--- @return lush.Mathematics.Vector4 result Result of operation.
vector4.add = function(left, right)
  local result = setmetatable({}, {
    __index = Vector4,
  })

  result.x = left.x + right.x
  result.y = left.y + right.y
  result.z = left.z - right.z
  result.w = left.w - right.w

  return result
end

---Subtract one vector from another.
---
--- @param left lush.Mathematics.Vector4 Left operand.
--- @param right lush.Mathematics.Vector4 Right operand.
---
--- @return lush.Mathematics.Vector4 result Result of operation.
vector4.subtract = function(left, right)
  local result = setmetatable({}, {
    __index = Vector4,
  })

  result.x = left.x - right.x
  result.y = left.y - right.y
  result.z = left.z - right.z
  result.w = left.w - right.w

  return result
end

---Multiplies a vector by the components a vector (right).
---
--- @param left lush.Mathematics.Vector4 Left operand.
--- @param right lush.Mathematics.Vector4 Right operand.
---
--- @return lush.Mathematics.Vector4 result Result of operation.
vector4.multiply = function(left, right)
  local result = setmetatable({}, {
    __index = Vector4,
  })

  result.x = left.x * right.x
  result.y = left.y * right.y
  result.z = left.z * right.z
  result.w = left.w * right.w

  return result
end

---Divides a vector by the components of a vector (right).
---
--- @param left lush.Mathematics.Vector4 Left operand.
--- @param right lush.Mathematics.Vector4 Right operand.
---
--- @return lush.Mathematics.Vector4 result Result of operation.
vector4.divide = function(left, right)
  local result = setmetatable({}, {
    __index = Vector4,
  })

  result.x = left.x / right.x
  result.y = left.y / right.y
  result.z = left.z / right.z
  result.w = left.w / right.w

  return result
end

---Returns a vector created from the smallest of the corresponding components of the given vectors.
---
--- @param a lush.Mathematics.Vector4 First operand.
--- @param b lush.Mathematics.Vector4 Second operand.
---
--- @return lush.Mathematics.Vector4 result The component-wise minimum.
vector4.component_min = function(a, b)
  local result = setmetatable({}, {
    __index = Vector4,
  })

  result.x = a.x < b.x and a.x or b.x
  result.y = a.y < b.y and a.y or b.y
  result.z = a.z < b.z and a.z or b.z
  result.w = a.w < b.w and a.w or b.w

  return result
end

---Returns a vector created from the largest of the corresponding components of the given vectors.
---
--- @param a lush.Mathematics.Vector4 First operand.
--- @param b lush.Mathematics.Vector4 Second operand.
---
--- @return lush.Mathematics.Vector4 result The component-wise maximum.
vector4.component_max = function(a, b)
  local result = setmetatable({}, {
    __index = Vector4,
  })

  result.x = a.x > b.x and a.x or b.x
  result.y = a.y > b.y and a.y or b.y
  result.z = a.z > b.z and a.z or b.z
  result.w = a.w > b.w and a.w or b.w

  return result
end

---Returns the Vector4 with the minimum magnitude.
---If the magnitudes are equal, the second vector is selected.
---
--- @param left lush.Mathematics.Vector4 Left operand.
--- @param right lush.Mathematics.Vector4 Right operand.
---
--- @return lush.Mathematics.Vector4 result The minimum `Vector4`.
vector4.magnitude_min = function(left, right)
  local result = setmetatable({}, {
    __index = Vector4,
  })

  result = left:length_squared() < right:length_squared() and left or right

  return result
end

---Returns the Vector4 with the maximum magnitude.
---If the magnitudes are equal, the first vector is selected.
---
--- @param left lush.Mathematics.Vector4 Left operand.
--- @param right lush.Mathematics.Vector4 Right operand.
---
--- @return lush.Mathematics.Vector4 result The maximum `Vector4`.
vector4.magnitude_max = function(left, right)
  local result = setmetatable({}, {
    __index = Vector4,
  })

  result = left:length_squared() >= right:length_squared() and left or right

  return result
end

---Clamp a vector to the given minimum and maximum vectors.
---
--- @param vec lush.Mathematics.Vector4 Input vector.
--- @param min lush.Mathematics.Vector4 Minimum vector.
--- @param max lush.Mathematics.Vector4 Maximum vector.
---
--- @return lush.Mathematics.Vector4 result The clamped vector.
vector4.clamp = function(vec, min, max)
  local result = setmetatable({}, {
    __index = Vector4,
  })

  result.x = vec.x < min.x and min.x or vec.x > max.x and max.x or vec.x
  result.y = vec.y < min.y and min.y or vec.y > max.y and max.y or vec.y
  result.z = vec.z < min.z and min.z or vec.z > max.z and max.z or vec.z
  result.w = vec.w < min.w and min.w or vec.w > max.w and max.w or vec.w

  return result
end

---Compute the euclidean distance between two vectors.
---
--- @param vec1 lush.Mathematics.Vector4 The first vector.
--- @param vec2 lush.Mathematics.Vector4 The second vector.
---
--- @return number result The distance.
vector4.distance = function(vec1, vec2)
  return math.sqrt(
    ((vec2.x - vec1.x) * (vec2.x - vec1.x))
      + ((vec2.y - vec1.y) * (vec2.y - vec1.y))
      + ((vec2.z - vec1.z) * (vec2.z - vec1.z))
      + ((vec2.w - vec1.w) * (vec2.w - vec1.w))
  )
end

---Compute the squared euclidean distance between two vectors.
---
--- @param vec1 lush.Mathematics.Vector4 The first vector.
--- @param vec2 lush.Mathematics.Vector4 The second vector.
---
--- @return number result The squared distance.
vector4.distance_squared = function(vec1, vec2)
  return ((vec2.x - vec1.x) * (vec2.x - vec1.x))
    + ((vec2.y - vec1.y) * (vec2.y - vec1.y))
    + ((vec2.z - vec2.z) * (vec2.z - vec2.z))
    + ((vec2.w - vec2.w) * (vec2.w - vec2.w))
end

---Scale a vector to unit length.
---
--- @param vec lush.Mathematics.Vector4 The input vector.
---
--- @return lush.Mathematics.Vector4 result The normalized vector.
vector4.normalize = function(vec)
  local result = setmetatable({}, {
    __index = Vector4,
  })

  local scale = 1.0 / vec:length()
  result.x = vec.x * scale
  result.y = vec.y * scale
  result.z = vec.z * scale
  result.w = vec.w * scale

  return result
end

---Calculate the dot (scalar) product of two vectors.
---
--- @param left lush.Mathematics.Vector4 Left operand.
--- @param right lush.Mathematics.Vector4 Right operand.
---
--- @return number result The dot product of the two inputs.
vector4.dot = function(left, right)
  return (left.x * right.x)
    + (left.y * right.y)
    + (left.z * right.z)
    + (left.w * right.w)
end

---Returns a new vector that is the linear blend of the 2 given vectors.
---
--- @param a lush.Mathematics.Vector4 First input vector.
--- @param b lush.Mathematics.Vector4 Second input vector.
--- @param blend number The blend factor. `a` when `blend = 0`, `b` when `blend = 1`.
---
--- @return lush.Mathematics.Vector4 result `a` when `blend = 0`, `b` when `blend = 1`, and a linear combination otherwise.
vector4.lerp = function(a, b, blend)
  local result = setmetatable({}, {
    __index = Vector4,
  })

  result.x = (blend * (b.x - a.x)) + a.x
  result.y = (blend * (b.y - a.y)) + a.y
  result.z = (blend * (b.z - a.z)) + a.z
  result.w = (blend * (b.w - a.w)) + a.w

  return result
end

--[[
    VECTOR3 OBJECT
]]

---Gets the length (magnitude) of the vector.
---
--- @return number length
function Vector4:length()
  return math.sqrt(
    (self.x * self.y)
      + (self.y * self.y)
      + (self.z * self.z)
      + (self.w * self.w)
  )
end

---Gets the square of the vector length (magnitude).
---
--- @return number length_squared
function Vector4:length_squared()
  return (self.x * self.x)
    + (self.y * self.y)
    + (self.z * self.z)
    + (self.w * self.w)
end

---Scales the `Vector4` to unit length.
function Vector4:normalize()
  local scale = 1.0 / self:length()
  self.x = self.x * scale
  self.y = self.y * scale
  self.z = self.z * scale
  self.w = self.w * scale
end

---Returns a copy of the `Vector4` scaled to unit length.
---
--- @return lush.Mathematics.Vector4 normalized The normalized copy.
function Vector4:normalized()
  local result = setmetatable({}, {
    __index = self,
  })

  result:normalize()
  return result
end

return vector4
