local vector4 = {}

--- @class lush.Descriptors.Vector4
--- @field x number The X component of the vector.
--- @field y number The Y component of the vector.
--- @field z number The Z component of the vector.
--- @field w number The W component of the vector.

---Represents a 4D vector using four high-precision numbers.
--- @class lush.Mathematics.Vector4 : lush.Descriptors.Vector4
--- @field x number The X component of the vector.
--- @field y number The Y component of the vector.
--- @field z number The Z component of the vector.
--- @field w number The W component of the vector.
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

---Initializes a new instance of the vector struct.
---
--- @param x? number The X coordinate of the vector.
--- @param y? number The Y coordinate of the vector.
--- @param z? number The Z coordinate of the vector.
--- @param w? number The W coordinate of the vector.
---
--- @return lush.Mathematics.Vector4 result Result of operation.
vector4.create_from_xyzw = function(x, y, z, w)
  local object = setmetatable({}, {
    __index = Vector4,
  })

  object.x = x or 0.0
  object.y = y or 0.0
  object.z = z or 0.0
  object.w = w or 0.0

  return object
end

---Initializes a new instance of the vector struct.
---
--- @param value? number The value that will initialize this instance.
---
--- @return lush.Mathematics.Vector4 result Result of operation.
vector4.create_from_value = function(value)
  local object = setmetatable({}, {
    __index = Vector4,
  })

  object.x = value or 0.0
  object.y = value or 0.0
  object.z = value or 0.0
  object.w = value or 0.0

  return object
end

---Initializes a new instance of the vector struct.
---
--- @param vector? lush.Descriptors.Vector4
---
--- @return lush.Mathematics.Vector4 result Result of operation.
vector4.create_from_vector4 = function(vector)
  local object = setmetatable({}, {
    __index = Vector4,
  })

  if vector ~= nil then
    object.x = vector.x or 0.0
    object.y = vector.y or 0.0
    object.z = vector.z or 0.0
    object.w = vector.z or 0.0
  end

  return object
end

---Deconstructs the vector into it's individual components.
---
--- @param vec lush.Descriptors.Vector4
---
--- @return number x The X component of the vector.
--- @return number y The Y component of the vector.
--- @return number z The Z component of the vector.
--- @return number w The W component of the vector.
vector4.deconstruct = function(vec)
  local object = vector4.create_from_vector4(vec)

  return object.x, object.y, object.z, object.w
end

--[[
    VECTOR4 STATIC METHODS
]]

---Adds two vectors.
---
--- @param left lush.Descriptors.Vector4 Left operand.
--- @param right lush.Descriptors.Vector4 Right operand.
---
--- @return lush.Mathematics.Vector4 result Result of operation.
vector4.add = function(left, right)
  return vector4.create_from_vector4({
    x = left.x + right.x,
    y = left.y + right.y,
    z = left.z + right.z,
    w = left.w + right.w,
  })
end

---Subtract one vector from another.
---
--- @param left lush.Descriptors.Vector4 Left operand.
--- @param right lush.Descriptors.Vector4 Right operand.
---
--- @return lush.Mathematics.Vector4 result Result of operation.
vector4.subtract = function(left, right)
  return vector4.create_from_vector4({
    x = left.x - right.x,
    y = left.y - right.y,
    z = left.z - right.z,
    w = left.w - right.w,
  })
end

---Multiplies a vector by the components a vector (right).
---
--- @param left lush.Descriptors.Vector4 Left operand.
--- @param right lush.Descriptors.Vector4 Right operand.
---
--- @return lush.Mathematics.Vector4 result Result of operation.
vector4.multiply = function(left, right)
  return vector4.create_from_vector4({
    x = left.x * right.x,
    y = left.y * right.y,
    z = left.z * right.z,
    w = left.w * right.w,
  })
end

---Divides a vector by the components of a vector (right).
---
--- @param left lush.Descriptors.Vector4 Left operand.
--- @param right lush.Descriptors.Vector4 Right operand.
---
--- @return lush.Mathematics.Vector4 result Result of operation.
vector4.divide = function(left, right)
  return vector4.create_from_vector4({
    x = left.x / right.x,
    y = left.y / right.y,
    z = left.z / right.z,
    w = left.w / right.w,
  })
end

---Returns a vector created from the smallest of the corresponding components of the given vectors.
---
--- @param a lush.Descriptors.Vector4 First operand.
--- @param b lush.Descriptors.Vector4 Second operand.
---
--- @return lush.Mathematics.Vector4 result The component-wise minimum.
vector4.component_min = function(a, b)
  return vector4.create_from_vector4({
    x = a.x < b.x and a.x or b.x,
    y = a.y < b.y and a.y or b.y,
    z = a.z < b.z and a.z or b.z,
    w = a.w < b.w and a.w or b.w,
  })
end

---Returns a vector created from the largest of the corresponding components of the given vectors.
---
--- @param a lush.Descriptors.Vector4 First operand.
--- @param b lush.Descriptors.Vector4 Second operand.
---
--- @return lush.Mathematics.Vector4 result The component-wise maximum.
vector4.component_max = function(a, b)
  return vector4.create_from_vector4({
    x = a.x > b.x and a.x or b.x,
    y = a.y > b.y and a.y or b.y,
    z = a.z > b.z and a.z or b.z,
    w = a.w > b.w and a.w or b.w,
  })
end

---Returns the vector with the minimum magnitude.
---If the magnitudes are equal, the second vector is selected.
---
--- @param left lush.Descriptors.Vector4 Left operand.
--- @param right lush.Descriptors.Vector4 Right operand.
---
--- @return lush.Mathematics.Vector4 result The minimum `Vector4`.
vector4.magnitude_min = function(left, right)
  left = vector4.create_from_vector4(left)
  right = vector4.create_from_vector4(right)

  return left:length_squared() < right:length_squared() and left or right
end

---Returns the vector with the maximum magnitude.
---If the magnitudes are equal, the first vector is selected.
---
--- @param left lush.Descriptors.Vector4 Left operand.
--- @param right lush.Descriptors.Vector4 Right operand.
---
--- @return lush.Mathematics.Vector4 result The maximum `Vector4`.
vector4.magnitude_max = function(left, right)
  left = vector4.create_from_vector4(left)
  right = vector4.create_from_vector4(right)

  return left:length_squared() >= right:length_squared() and left or right
end

---Clamp a vector to the given minimum and maximum vectors.
---
--- @param vec lush.Descriptors.Vector4 Input vector.
--- @param min lush.Descriptors.Vector4 Minimum vector.
--- @param max lush.Descriptors.Vector4 Maximum vector.
---
--- @return lush.Mathematics.Vector4 result The clamped vector.
vector4.clamp = function(vec, min, max)
  return vector4.create_from_vector4({
    x = vec.x < min.x and min.x or vec.x > max.x and max.x or vec.x,
    y = vec.y < min.y and min.y or vec.y > max.y and max.y or vec.y,
    z = vec.z < min.z and min.z or vec.z > max.z and max.z or vec.z,
    w = vec.w < min.w and min.w or vec.w > max.w and max.w or vec.w,
  })
end

---Compute the euclidean distance between two vectors.
---
--- @param vec1 lush.Descriptors.Vector4 The first vector.
--- @param vec2 lush.Descriptors.Vector4 The second vector.
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
--- @param vec1 lush.Descriptors.Vector4 The first vector.
--- @param vec2 lush.Descriptors.Vector4 The second vector.
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
--- @param vec lush.Descriptors.Vector4 The input vector.
---
--- @return lush.Mathematics.Vector4 result The normalized vector.
vector4.normalize = function(vec)
  vec = vector4.create_from_vector4(vec)

  local scale = 1.0 / vec:length()

  return vector4.create_from_vector4({
    x = vec.x * scale,
    y = vec.y * scale,
    z = vec.z * scale,
    w = vec.w * scale,
  })
end

---Calculate the dot (scalar) product of two vectors.
---
--- @param left lush.Descriptors.Vector4 Left operand.
--- @param right lush.Descriptors.Vector4 Right operand.
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
--- @param a lush.Descriptors.Vector4 First input vector.
--- @param b lush.Descriptors.Vector4 Second input vector.
--- @param blend number The blend factor. `a` when `blend = 0`, `b` when `blend = 1`.
---
--- @return lush.Mathematics.Vector4 result `a` when `blend = 0`, `b` when `blend = 1`, and a linear combination otherwise.
vector4.lerp = function(a, b, blend)
  return vector4.create_from_vector4({
    x = (blend * (b.x - a.x)) + a.x,
    y = (blend * (b.y - a.y)) + a.y,
    z = (blend * (b.z - a.z)) + a.z,
    w = (blend * (b.w - a.w)) + a.w,
  })
end

--[[
    VECTOR4 OBJECT
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

---Scales the vector to unit length.
function Vector4:normalize()
  local scale = 1.0 / self:length()
  self.x = self.x * scale
  self.y = self.y * scale
  self.z = self.z * scale
  self.w = self.w * scale
end

---Returns a copy of the vector scaled to unit length.
---
--- @return lush.Mathematics.Vector4 normalized The normalized copy.
function Vector4:normalized()
  local result = vector4.create_from_vector4(self)

  result:normalize()
  return result
end

return vector4
