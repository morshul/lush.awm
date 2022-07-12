local vector2 = {}

--- @class lush.Descriptors.Vector2
--- @field x number The X component of the vector.
--- @field y number The Y component of the vector.

---Represents a 2D vector using two high-precision numbers.
--- @class lush.Mathematics.Vector2 : lush.Descriptors.Vector2
--- @field x number The X component of the vector.
--- @field y number The Y component of the vector.
local Vector2 = setmetatable({}, {
  __index = {
    x = 0.0,
    y = 0.0,
  },
})

local META = {}

META.__tostring = function(object)
  return string.format('(%s, %s)', object.x, object.y)
end

META.__add = function(object, value)
  return vector2.add(object, value)
end

META.__sub = function(object, value)
  return vector2.subtract(object, value)
end

META.__mul = function(object, value)
  return vector2.multiply(object, value)
end

META.__div = function(object, value)
  return vector2.divide(object, value)
end

META.__eq = function(object, value)
  return vector2.equals(object, value)
end

--[[
    VECTOR2 CONSTRUCTOR
]]

---Initializes a new instance of the vector struct.
---
--- @param x? number The X coordinate of the vector.
--- @param y? number The Y coordinate of the vector.
---
--- @return lush.Mathematics.Vector2 result Result of operation.
vector2.create_from_xy = function(x, y)
  local object = setmetatable({}, {
    __index = Vector2,
    __tostring = META.__tostring,
    __add = META.__add,
    __sub = META.__sub,
    __mul = META.__mul,
    __div = META.__div,
    __eq = META.__eq,
  })

  object.x = x or 0.0
  object.y = y or 0.0

  return object
end

---Initializes a new instance of the vector struct.
---
--- @param value? number The value that will initialize this instance.
---
--- @return lush.Mathematics.Vector2 result Result of operation.
vector2.create_from_value = function(value)
  local object = setmetatable({}, {
    __index = Vector2,
    __tostring = META.__tostring,
    __add = META.__add,
    __sub = META.__sub,
    __mul = META.__mul,
    __div = META.__div,
    __eq = META.__eq,
  })

  object.x = value or 0.0
  object.y = value or 0.0

  return object
end

---Initializes a new instance of the vector struct.
---
--- @param vector? lush.Descriptors.Vector2
---
--- @return lush.Mathematics.Vector2 result Result of operation.
vector2.create_from_vector2 = function(vector)
  local object = setmetatable({}, {
    __index = Vector2,
    __tostring = META.__tostring,
    __add = META.__add,
    __sub = META.__sub,
    __mul = META.__mul,
    __div = META.__div,
    __eq = META.__eq,
  })

  if vector ~= nil then
    object.x = vector.x or 0.0
    object.y = vector.y or 0.0
  end

  return object
end

---Deconstructs the vector into it's individual components.
---
--- @param vec lush.Descriptors.Vector2
---
--- @return number x The X component of the vector.
--- @return number y The Y component of the vector.
vector2.deconstruct = function(vec)
  local object = vector2.create_from_vector2(vec)

  return object.x, object.y
end

--[[
    VECTOR2 STATIC METHODS
]]

---Adds two vectors.
---
--- @param left lush.Descriptors.Vector2 Left operand.
--- @param right lush.Descriptors.Vector2 Right operand.
---
--- @return lush.Mathematics.Vector2 result Result of operation.
vector2.add = function(left, right)
  return vector2.create_from_vector2({
    x = right.x + left.x,
    y = right.y + left.y,
  })
end

---Subtract one vector from another.
---
--- @param left lush.Descriptors.Vector2 Left operand.
--- @param right lush.Descriptors.Vector2 Right operand.
---
--- @return lush.Mathematics.Vector2 result Result of operation.
vector2.subtract = function(left, right)
  return vector2.create_from_vector2({
    x = left.x - right.x,
    y = left.y - right.y,
  })
end

---Multiplies a vector by the components a vector (right).
---
--- @param left lush.Descriptors.Vector2 Left operand.
--- @param right lush.Descriptors.Vector2 Right operand.
---
--- @return lush.Mathematics.Vector2 result Result of operation.
vector2.multiply = function(left, right)
  return vector2.create_from_vector2({
    x = left.x * right.x,
    y = left.y * right.y,
  })
end

---Divides a vector by the components of a vector (right).
---
--- @param left lush.Descriptors.Vector2 Left operand.
--- @param right lush.Descriptors.Vector2 Right operand.
---
--- @return lush.Mathematics.Vector2 result Result of operation.
vector2.divide = function(left, right)
  return vector2.create_from_vector2({
    x = left.x / right.x,
    y = left.y / right.y,
  })
end

--- @param left lush.Descriptors.Vector2 Left operand.
--- @param right lush.Descriptors.Vector2 Right operand.
---
--- @return boolean result Result of operation.
vector2.equals = function(left, right)
  return left.x == right.x and left.y == right.y
end

---Returns a vector created from the smallest of the corresponding components of the given vectors.
---
--- @param a lush.Descriptors.Vector2 First operand.
--- @param b lush.Descriptors.Vector2 Second operand.
---
--- @return lush.Mathematics.Vector2 result The component-wise minimum.
vector2.component_min = function(a, b)
  return vector2.create_from_vector2({
    x = a.x < b.x and a.x or b.x,
    y = a.y < b.y and a.y or b.y,
  })
end

---Returns a vector created from the largest of the corresponding components of the given vectors.
---
--- @param a lush.Descriptors.Vector2 First operand.
--- @param b lush.Descriptors.Vector2 Second operand.
---
--- @return lush.Mathematics.Vector2 result The component-wise maximum.
vector2.component_max = function(a, b)
  return vector2.create_from_vector2({
    x = a.x > b.x and a.x or b.x,
    y = a.y > b.y and a.y or b.y,
  })
end

---Returns the vector with the minimum magnitude.
---If the magnitudes are equal, the second vector is selected.
---
--- @param left lush.Descriptors.Vector2 Left operand.
--- @param right lush.Descriptors.Vector2 Right operand.
---
--- @return lush.Mathematics.Vector2 result The minimum `Vector2`.
vector2.magnitude_min = function(left, right)
  left = vector2.create_from_vector2(left)
  right = vector2.create_from_vector2(right)

  return left:length_squared() < right:length_squared() and left or right
end

---Returns the vector with the maximum magnitude.
---If the magnitudes are equal, the first vector is selected.
---
--- @param left lush.Descriptors.Vector2 Left operand.
--- @param right lush.Descriptors.Vector2 Right operand.
---
--- @return lush.Mathematics.Vector2 result The maximum `Vector2`.
vector2.magnitude_max = function(left, right)
  left = vector2.create_from_vector2(left)
  right = vector2.create_from_vector2(right)

  return left:length_squared() >= right:length_squared() and left or right
end

---Clamp a vector to the given minimum and maximum vectors.
---
--- @param vec lush.Descriptors.Vector2 Input vector.
--- @param min lush.Descriptors.Vector2 Minimum vector.
--- @param max lush.Descriptors.Vector2 Maximum vector.
---
--- @return lush.Mathematics.Vector2 result The clamped vector.
vector2.clamp = function(vec, min, max)
  return vector2.create_from_vector2({
    x = vec.x < min.x and min.x or vec.x > max.x and max.x or vec.x,
    y = vec.y < min.y and min.y or vec.y > max.y and max.y or vec.y,
  })
end

---Compute the euclidean distance between two vectors.
---
--- @param vec1 lush.Descriptors.Vector2 The first vector.
--- @param vec2 lush.Descriptors.Vector2 The second vector.
---
--- @return number result The distance.
vector2.distance = function(vec1, vec2)
  return math.sqrt(
    ((vec2.x - vec1.x) * (vec2.x - vec1.x))
      + ((vec2.y - vec1.y) * (vec2.y - vec1.y))
  )
end

---Compute the squared euclidean distance between two vectors.
---
--- @param vec1 lush.Descriptors.Vector2 The first vector.
--- @param vec2 lush.Descriptors.Vector2 The second vector.
---
--- @return number result The squared distance.
vector2.distance_squared = function(vec1, vec2)
  return ((vec2.x - vec1.x) * (vec2.x - vec1.x))
    + ((vec2.y - vec1.y) * (vec2.y - vec1.y))
end

---Scale a vector to unit length.
---
--- @param vec lush.Descriptors.Vector2 The input vector.
---
--- @return lush.Mathematics.Vector2 result The normalized vector.
vector2.normalize = function(vec)
  vec = vector2.create_from_vector2(vec)

  local scale = 1.0 / vec:length()

  return vector2.create_from_vector2({
    x = vec.x * scale,
    y = vec.y * scale,
  })
end

---Calculate the dot (scalar) product of two vectors.
---
--- @param left lush.Descriptors.Vector2 Left operand.
--- @param right lush.Descriptors.Vector2 Right operand.
---
--- @return number result The dot product of the two inputs.
vector2.dot = function(left, right)
  return (left.x * right.x) + (left.y * right.y)
end

---Calculate the perpendicular dot (scalar) product of two vectors.
---
--- @param left lush.Descriptors.Vector2 Left operand.
--- @param right lush.Descriptors.Vector2 Right operand.
---
--- @return number result The perpendicular dot product of two inputs.
vector2.perp_dot = function(left, right)
  return (left.x * right.y) - (left.y * right.x)
end

---Returns a new vector that is the linear blend of the 2 given vectors.
---
--- @param a lush.Descriptors.Vector2 First input vector.
--- @param b lush.Descriptors.Vector2 Second input vector.
--- @param blend number The blend factor. `a` when `blend = 0`, `b` when `blend = 1`.
---
--- @return lush.Mathematics.Vector2 result `a` when `blend = 0`, `b` when `blend = 1`, and a linear combination otherwise.
vector2.lerp = function(a, b, blend)
  return vector2.create_from_vector2({
    x = (blend * (b.x - a.x)) + a.x,
    y = (blend * (b.y - a.y)) + a.y,
  })
end

--[[
    VECTOR2 OBJECT
]]

---Gets the length (magnitude) of the vector.
---
--- @return number length
function Vector2:length()
  return math.sqrt((self.x * self.y) + (self.y * self.y))
end

---Gets the square of the vector length (magnitude).
---
--- @return number length_squared
function Vector2:length_squared()
  return (self.x * self.x) + (self.y * self.y)
end

---Gets the perpendicular vector on the right side of this vector.
---
--- @return lush.Mathematics.Vector2 result Result of operation.
function Vector2:perpendicular_right()
  return vector2.create_from_xy(self.y, -self.x)
end

---Gets the perpendicular vector on the left side of this vector.
---
--- @return lush.Mathematics.Vector2 result Result of operation.
function Vector2:perpendicular_left()
  return vector2.create_from_xy(-self.y, self.x)
end

---Scales the vector to unit length.
function Vector2:normalize()
  local scale = 1.0 / self:length()
  self.x = self.x * scale
  self.y = self.y * scale
end

---Returns a copy of the vector scaled to unit length.
---
--- @return lush.Mathematics.Vector2 normalized The normalized copy.
function Vector2:normalized()
  local result = vector2.create_from_vector2(self)

  result:normalize()
  return result
end

return vector2
