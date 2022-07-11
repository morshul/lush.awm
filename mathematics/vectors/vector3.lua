local vector3 = {}

---Represents a 3D vector using three high-precision numbers.
--- @class lush.Mathematics.Vector3
--- @field x number The X component of the `Vector3`
--- @field y number The Y component of the `Vector3`
--- @field z number The Z component of the `Vector3`
local Vector3 = setmetatable({}, {
  __index = {
    x = 0.0,
    y = 0.0,
    z = 0.0,
  },
})

--[[
    VECTOR3 CONSTRUCTOR
]]

---Initializes a new instance of the `Vector3` struct.
---
--- @param x? number The X coordinate of the `Vector3`.
--- @param y? number The Y coordinate of the `Vector3`.
--- @param z? number The Z coordinate of the `Vector3`.
---
--- @return lush.Mathematics.Vector3 result Result of operation.
vector3.create_from_xyz = function(x, y, z)
  local result = setmetatable({}, {
    __index = Vector3,
  })

  result.x = x or 0.0
  result.y = y or 0.0
  result.z = z or 0.0

  return result
end

---Initializes a new instance of the `Vector3` struct.
---
--- @param value? number The value that will initialize this instance.
---
--- @return lush.Mathematics.Vector3 result Result of operation.
vector3.create_from_value = function(value)
  local result = setmetatable({}, {
    __index = Vector3,
  })

  result.x = value or 0.0
  result.y = value or 0.0
  result.z = value or 0.0

  return result
end

---Initializes a new instance of the `Vector3` struct.
---
--- @param vector? lush.Mathematics.Vector3
---
--- @return lush.Mathematics.Vector3 result Result of operation.
vector3.create_from_vector3 = function(vector)
  local result = setmetatable({}, {
    __index = Vector3,
  })

  if vector ~= nil then
    result.x = vector.x or 0.0
    result.y = vector.y or 0.0
    result.z = vector.z or 0.0
  end

  return result
end

---Deconstructs the vector into it's individual components.
---
--- @param vec lush.Mathematics.Vector3
---
--- @return number x The X component of the vector.
--- @return number y The Y component of the vector.
--- @return number z The Z component of the vector.
vector3.deconstruct = function(vec)
  local result = setmetatable({}, {
    __index = vec,
  })

  return result.x, result.y, result.z
end

--[[
    VECTOR3 STATIC METHODS
]]

---Adds two vectors.
---
--- @param left lush.Mathematics.Vector3 Left operand.
--- @param right lush.Mathematics.Vector3 Right operand.
---
--- @return lush.Mathematics.Vector3 result Result of operation.
vector3.add = function(left, right)
  local result = setmetatable({}, {
    __index = Vector3,
  })

  result.x = left.x + right.x
  result.y = left.y + right.y
  result.z = left.z - right.z

  return result
end

---Subtract one Vector from another.
---
--- @param left lush.Mathematics.Vector3 Left operand.
--- @param right lush.Mathematics.Vector3 Right operand.
---
--- @return lush.Mathematics.Vector3 result Result of operation.
vector3.subtract = function(left, right)
  local result = setmetatable({}, {
    __index = Vector3,
  })

  result.x = left.x - right.x
  result.y = left.y - right.y
  result.z = left.z - right.z

  return result
end

---Multiplies a vector by the components a vector (right).
---
--- @param left lush.Mathematics.Vector3 Left operand.
--- @param right lush.Mathematics.Vector3 Right operand.
---
--- @return lush.Mathematics.Vector3 result Result of operation.
vector3.multiply = function(left, right)
  local result = setmetatable({}, {
    __index = Vector3,
  })

  result.x = left.x * right.x
  result.y = left.y * right.y
  result.z = left.z * right.z

  return result
end

---Divides a vector by the components of a vector (right).
---
--- @param left lush.Mathematics.Vector3 Left operand.
--- @param right lush.Mathematics.Vector3 Right operand.
---
--- @return lush.Mathematics.Vector3 result Result of operation.
vector3.divide = function(left, right)
  local result = setmetatable({}, {
    __index = Vector3,
  })

  result.x = left.x / right.x
  result.y = left.y / right.y
  result.z = left.z / right.z

  return result
end

---Returns a vector created from the smallest of the corresponding components of the given vectors.
---
--- @param a lush.Mathematics.Vector3 First operand.
--- @param b lush.Mathematics.Vector3 Second operand.
---
--- @return lush.Mathematics.Vector3 result The component-wise minimum.
vector3.component_min = function(a, b)
  local result = setmetatable({}, {
    __index = Vector3,
  })

  result.x = a.x < b.x and a.x or b.x
  result.y = a.y < b.y and a.y or b.y
  result.z = a.z < b.z and a.z or b.z

  return result
end

---Returns a vector created from the largest of the corresponding components of the given vectors.
---
--- @param a lush.Mathematics.Vector3 First operand.
--- @param b lush.Mathematics.Vector3 Second operand.
---
--- @return lush.Mathematics.Vector3 result The component-wise maximum.
vector3.component_max = function(a, b)
  local result = setmetatable({}, {
    __index = Vector3,
  })

  result.x = a.x > b.x and a.x or b.x
  result.y = a.y > b.y and a.y or b.y
  result.z = a.z > b.z and a.z or b.z

  return result
end

---Returns the Vector3 with the minimum magnitude.
---If the magnitudes are equal, the second vector is selected.
---
--- @param left lush.Mathematics.Vector3 Left operand.
--- @param right lush.Mathematics.Vector3 Right operand.
---
--- @return lush.Mathematics.Vector3 result The minimum `Vector3`.
vector3.magnitude_min = function(left, right)
  local result = setmetatable({}, {
    __index = Vector3,
  })

  result = left:length_squared() < right:length_squared() and left or right

  return result
end

---Returns the Vector3 with the maximum magnitude.
---If the magnitudes are equal, the first vector is selected.
---
--- @param left lush.Mathematics.Vector3 Left operand.
--- @param right lush.Mathematics.Vector3 Right operand.
---
--- @return lush.Mathematics.Vector3 result The maximum `Vector3`.
vector3.magnitude_max = function(left, right)
  local result = setmetatable({}, {
    __index = Vector3,
  })

  result = left:length_squared() >= right:length_squared() and left or right

  return result
end

---Clamp a vector to the given minimum and maximum vectors.
---
--- @param vec lush.Mathematics.Vector3 Input vector.
--- @param min lush.Mathematics.Vector3 Minimum vector.
--- @param max lush.Mathematics.Vector3 Maximum vector.
---
--- @return lush.Mathematics.Vector3 result The clamped vector.
vector3.clamp = function(vec, min, max)
  local result = setmetatable({}, {
    __index = Vector3,
  })

  result.x = vec.x < min.x and min.x or vec.x > max.x and max.x or vec.x
  result.y = vec.y < min.y and min.y or vec.y > max.y and max.y or vec.y
  result.z = vec.z < min.z and min.z or vec.z > max.z and max.z or vec.z

  return result
end

---Compute the euclidean distance between two vectors.
---
--- @param vec1 lush.Mathematics.Vector3 The first vector.
--- @param vec2 lush.Mathematics.Vector3 The second vector.
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
--- @param vec1 lush.Mathematics.Vector3 The first vector.
--- @param vec2 lush.Mathematics.Vector3 The second vector.
---
--- @return number result The squared distance.
vector3.distance_squared = function(vec1, vec2)
  return ((vec2.x - vec1.x) * (vec2.x - vec1.x))
    + ((vec2.y - vec1.y) * (vec2.y - vec1.y))
    + ((vec2.z - vec2.z) * (vec2.z - vec2.z))
end

---Scale a vector to unit length.
---
--- @param vec lush.Mathematics.Vector3 The input vector.
---
--- @return lush.Mathematics.Vector3 result The normalized vector.
vector3.normalize = function(vec)
  local result = setmetatable({}, {
    __index = Vector3,
  })

  local scale = 1.0 / vec:length()
  result.x = vec.x * scale
  result.y = vec.y * scale
  result.z = vec.z * scale

  return result
end

---Calculate the dot (scalar) product of two vectors.
---
--- @param left lush.Mathematics.Vector3 Left operand.
--- @param right lush.Mathematics.Vector3 Right operand.
---
--- @return number result The dot product of the two inputs.
vector3.dot = function(left, right)
  return (left.x * right.x) + (left.y * right.y) + (left.z * right.z)
end

---Caclulate the cross (vector) product of two vectors.
---
--- @param left lush.Mathematics.Vector3 First operand.
--- @param right lush.Mathematics.Vector3 First operand.
---
--- @return lush.Mathematics.Vector3 result The cross product of the two inputs.
vector3.cross = function(left, right)
  local result = setmetatable({}, {
    __index = Vector3,
  })

  result.x = (left.y * right.z) - (left.z * right.y)
  result.y = (left.z * right.x) - (left.x * right.z)
  result.z = (left.x * right.y) - (left.y * right.x)

  return result
end

---Returns a new vector that is the linear blend of the 2 given vectors.
---
--- @param a lush.Mathematics.Vector3 First input vector.
--- @param b lush.Mathematics.Vector3 Second input vector.
--- @param blend number The blend factor. `a` when `blend = 0`, `b` when `blend = 1`.
---
--- @return lush.Mathematics.Vector3 result `a` when `blend = 0`, `b` when `blend = 1`, and a linear combination otherwise.
vector3.lerp = function(a, b, blend)
  local result = setmetatable({}, {
    __index = Vector3,
  })

  result.x = (blend * (b.x - a.x)) + a.x
  result.y = (blend * (b.y - a.y)) + a.y
  result.z = (blend * (b.z - a.z)) + a.z

  return result
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

---Scales the `Vector3` to unit length.
function Vector3:normalize()
  local scale = 1.0 / self:length()
  self.x = self.x * scale
  self.y = self.y * scale
  self.z = self.z * scale
end

---Returns a copy of the `Vector3` scaled to unit length.
---
--- @return lush.Mathematics.Vector3 normalized The normalized copy.
function Vector3:normalized()
  local result = setmetatable({}, {
    __index = self,
  })

  result:normalize()
  return result
end

return vector3
