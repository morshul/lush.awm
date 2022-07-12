local vector3 = {}

--- @class lush.Descriptors.Vector3
--- @field x number The X component of the vector.
--- @field y number The Y component of the vector.
--- @field z number The Z component of the vector.

---Represents a 3D vector using three high-precision numbers.
--- @class lush.Mathematics.Vector3 : lush.Descriptors.Vector3
--- @field x number The X component of the vector.
--- @field y number The Y component of the vector.
--- @field z number The Z component of the vector.
local Vector3 = setmetatable({}, {
  __index = {
    x = 0.0,
    y = 0.0,
    z = 0.0,
  },
})

local META = {}

META.__tostring = function(object)
  return string.format('(%s, %s, %s)', object.x, object.y, object.z)
end

META.__add = function(object, value)
  return vector3.add(object, value)
end

META.__sub = function(object, value)
  return vector3.subtract(object, value)
end

META.__mul = function(object, value)
  return vector3.multiply(object, value)
end

META.__div = function(object, value)
  return vector3.divide(object, value)
end

META.__eq = function(object, value)
  return vector3.equals(object, value)
end

--[[
    VECTOR3 CONSTRUCTOR
]]

---Initializes a new instance of the vector struct.
---
--- @param x? number The X coordinate of the vector.
--- @param y? number The Y coordinate of the vector.
--- @param z? number The Z coordinate of the vector.
---
--- @return lush.Mathematics.Vector3 result Result of operation.
vector3.create_from_xyz = function(x, y, z)
  local object = setmetatable({}, {
    __index = Vector3,
    __tostring = META.__tostring,
    __add = META.__add,
    __sub = META.__sub,
    __mul = META.__mul,
    __div = META.__div,
    __eq = META.__eq,
  })

  object.x = x or 0.0
  object.y = y or 0.0
  object.z = z or 0.0

  return object
end

---Initializes a new instance of the vector struct.
---
--- @param value? number The value that will initialize this instance.
---
--- @return lush.Mathematics.Vector3 result Result of operation.
vector3.create_from_value = function(value)
  local object = setmetatable({}, {
    __index = Vector3,
    __tostring = META.__tostring,
    __add = META.__add,
    __sub = META.__sub,
    __mul = META.__mul,
    __div = META.__div,
    __eq = META.__eq,
  })

  object.x = value or 0.0
  object.y = value or 0.0
  object.z = value or 0.0

  return object
end

---Initializes a new instance of the vector struct.
---
--- @param vector? lush.Descriptors.Vector3
---
--- @return lush.Mathematics.Vector3 result Result of operation.
vector3.create_from_vector3 = function(vector)
  local object = setmetatable({}, {
    __index = Vector3,
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
    object.z = vector.z or 0.0
  end

  return object
end

---Deconstructs the vector into it's individual components.
---
--- @param vec lush.Descriptors.Vector3
---
--- @return number x The X component of the vector.
--- @return number y The Y component of the vector.
--- @return number z The Z component of the vector.
vector3.deconstruct = function(vec)
  local object = vector3.create_from_vector3(vec)

  return object.x, object.y, object.z
end

--[[
    VECTOR3 STATIC METHODS
]]

---Adds two vectors.
---
--- @param left lush.Descriptors.Vector3 Left operand.
--- @param right lush.Descriptors.Vector3 Right operand.
---
--- @return lush.Mathematics.Vector3 result Result of operation.
vector3.add = function(left, right)
  return vector3.create_from_vector3({
    x = left.x + right.x,
    y = left.y + right.y,
    z = left.z + right.z,
  })
end

---Subtract one vector from another.
---
--- @param left lush.Descriptors.Vector3 Left operand.
--- @param right lush.Descriptors.Vector3 Right operand.
---
--- @return lush.Mathematics.Vector3 result Result of operation.
vector3.subtract = function(left, right)
  return vector3.create_from_vector3({
    x = left.x - right.x,
    y = left.y - right.y,
    z = left.z - right.z,
  })
end

---Multiplies a vector by the components a vector (right).
---
--- @param left lush.Descriptors.Vector3 Left operand.
--- @param right lush.Descriptors.Vector3 Right operand.
---
--- @return lush.Mathematics.Vector3 result Result of operation.
vector3.multiply = function(left, right)
  return vector3.create_from_vector3({
    x = left.x * right.x,
    y = left.y * right.y,
    z = left.z * right.z,
  })
end

---Divides a vector by the components of a vector (right).
---
--- @param left lush.Descriptors.Vector3 Left operand.
--- @param right lush.Descriptors.Vector3 Right operand.
---
--- @return lush.Mathematics.Vector3 result Result of operation.
vector3.divide = function(left, right)
  return vector3.create_from_vector3({
    x = left.x / right.x,
    y = left.y / right.y,
    z = left.z / right.z,
  })
end

--- @param left lush.Descriptors.Vector3 Left operand.
--- @param right lush.Descriptors.Vector3 Right operand.
---
--- @return boolean result Result of operation.
vector3.equals = function(left, right)
  return left.x == right.x and left.y == right.y and left.z == right.z
end

---Returns a vector created from the smallest of the corresponding components of the given vectors.
---
--- @param a lush.Descriptors.Vector3 First operand.
--- @param b lush.Descriptors.Vector3 Second operand.
---
--- @return lush.Mathematics.Vector3 result The component-wise minimum.
vector3.component_min = function(a, b)
  return vector3.create_from_vector3({
    x = a.x < b.x and a.x or b.x,
    y = a.y < b.y and a.y or b.y,
    z = a.z < b.z and a.z or b.z,
  })
end

---Returns a vector created from the largest of the corresponding components of the given vectors.
---
--- @param a lush.Descriptors.Vector3 First operand.
--- @param b lush.Descriptors.Vector3 Second operand.
---
--- @return lush.Mathematics.Vector3 result The component-wise maximum.
vector3.component_max = function(a, b)
  return vector3.create_from_vector3({
    x = a.x > b.x and a.x or b.x,
    y = a.y > b.y and a.y or b.y,
    z = a.z > b.z and a.z or b.z,
  })
end

---Returns the vector with the minimum magnitude.
---If the magnitudes are equal, the second vector is selected.
---
--- @param left lush.Descriptors.Vector3 Left operand.
--- @param right lush.Descriptors.Vector3 Right operand.
---
--- @return lush.Mathematics.Vector3 result The minimum `Vector3`.
vector3.magnitude_min = function(left, right)
  left = vector3.create_from_vector3(left)
  right = vector3.create_from_vector3(right)

  return left:length_squared() < right:length_squared() and left or right
end

---Returns the vector with the maximum magnitude.
---If the magnitudes are equal, the first vector is selected.
---
--- @param left lush.Descriptors.Vector3 Left operand.
--- @param right lush.Descriptors.Vector3 Right operand.
---
--- @return lush.Mathematics.Vector3 result The maximum `Vector3`.
vector3.magnitude_max = function(left, right)
  left = vector3.create_from_vector3(left)
  right = vector3.create_from_vector3(right)

  return left:length_squared() >= right:length_squared() and left or right
end

---Clamp a vector to the given minimum and maximum vectors.
---
--- @param vec lush.Descriptors.Vector3 Input vector.
--- @param min lush.Descriptors.Vector3 Minimum vector.
--- @param max lush.Descriptors.Vector3 Maximum vector.
---
--- @return lush.Mathematics.Vector3 result The clamped vector.
vector3.clamp = function(vec, min, max)
  return vector3.create_from_vector3({
    x = vec.x < min.x and min.x or vec.x > max.x and max.x or vec.x,
    y = vec.y < min.y and min.y or vec.y > max.y and max.y or vec.y,
    z = vec.z < min.z and min.z or vec.z > max.z and max.z or vec.z,
  })
end

---Compute the euclidean distance between two vectors.
---
--- @param vec1 lush.Descriptors.Vector3 The first vector.
--- @param vec2 lush.Descriptors.Vector3 The second vector.
---
--- @return number result The distance.
vector3.distance = function(vec1, vec2)
  return math.sqrt(
    ((vec2.x - vec1.x) * (vec2.x - vec1.x))
      + ((vec2.y - vec1.y) * (vec2.y - vec1.y))
      + ((vec2.z - vec1.z) * (vec2.z - vec1.z))
  )
end

---Compute the squared euclidean distance between two vectors.
---
--- @param vec1 lush.Descriptors.Vector3 The first vector.
--- @param vec2 lush.Descriptors.Vector3 The second vector.
---
--- @return number result The squared distance.
vector3.distance_squared = function(vec1, vec2)
  return ((vec2.x - vec1.x) * (vec2.x - vec1.x))
    + ((vec2.y - vec1.y) * (vec2.y - vec1.y))
    + ((vec2.z - vec2.z) * (vec2.z - vec2.z))
end

---Scale a vector to unit length.
---
--- @param vec lush.Descriptors.Vector3 The input vector.
---
--- @return lush.Mathematics.Vector3 result The normalized vector.
vector3.normalize = function(vec)
  vec = vector3.create_from_vector3(vec)

  local scale = 1.0 / vec:length()

  return vector3.create_from_vector3({
    x = vec.x * scale,
    y = vec.y * scale,
    z = vec.z * scale,
  })
end

---Calculate the dot (scalar) product of two vectors.
---
--- @param left lush.Descriptors.Vector3 Left operand.
--- @param right lush.Descriptors.Vector3 Right operand.
---
--- @return number result The dot product of the two inputs.
vector3.dot = function(left, right)
  return (left.x * right.x) + (left.y * right.y) + (left.z * right.z)
end

---Caclulate the cross (vector) product of two vectors.
---
--- @param left lush.Descriptors.Vector3 First operand.
--- @param right lush.Descriptors.Vector3 First operand.
---
--- @return lush.Mathematics.Vector3 result The cross product of the two inputs.
vector3.cross = function(left, right)
  return vector3.create_from_vector3({
    x = (left.y * right.z) - (left.z * right.y),
    y = (left.z * right.x) - (left.x * right.z),
    z = (left.x * right.y) - (left.y * right.x),
  })
end

---Returns a new vector that is the linear blend of the 2 given vectors.
---
--- @param a lush.Descriptors.Vector3 First input vector.
--- @param b lush.Descriptors.Vector3 Second input vector.
--- @param blend number The blend factor. `a` when `blend = 0`, `b` when `blend = 1`.
---
--- @return lush.Mathematics.Vector3 result `a` when `blend = 0`, `b` when `blend = 1`, and a linear combination otherwise.
vector3.lerp = function(a, b, blend)
  return vector3.create_from_vector3({
    x = (blend * (b.x - a.x)) + a.x,
    y = (blend * (b.y - a.y)) + a.y,
    z = (blend * (b.z - a.z)) + a.z,
  })
end

--[[
    VECTOR3 OBJECT
]]

---Gets the length (magnitude) of the vector.
---
--- @return number length
function Vector3:length()
  return math.sqrt((self.x * self.y) + (self.y * self.y) + (self.z * self.z))
end

---Gets the square of the vector length (magnitude).
---
--- @return number length_squared
function Vector3:length_squared()
  return (self.x * self.x) + (self.y * self.y) + (self.z * self.z)
end

---Scales the vector to unit length.
function Vector3:normalize()
  local scale = 1.0 / self:length()
  self.x = self.x * scale
  self.y = self.y * scale
  self.z = self.z * scale
end

---Returns a copy of the vector scaled to unit length.
---
--- @return lush.Mathematics.Vector3 normalized The normalized copy.
function Vector3:normalized()
  local result = vector3.create_from_vector3(self)

  result:normalize()
  return result
end

return vector3
