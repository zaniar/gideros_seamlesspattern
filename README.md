gideros_seamlesspattern
=======================

Seamless pattern library for Gideros

```SeamlessPattern.new(path, properties)```

**Parameters:**
 **path:** (string) Path to pattern image
 **properties:** (table) Pattern properties. Available properties:
  * **speedX:**	(number, default = 0) pattern's Y translation per frame
  * **speedY:** (number, default = 0) pattern's X translation per frame
  * **m11:** (number, default = 1) 1,1 element of pattern's transformation matrix
  * **m12:** (number, default = 0) 1,2 element of pattern's transformation matrix
  * **m21:** (number, default = 0) 2.1 element of pattern's transformation matrix
  * **m22:** (number, default = 1) 2,2 element of pattern's transformation matrix
  * **vertices:** (table, default = a rectangle that cover entire screen) A list of numbers that contains the x, y coordinates of the vertices sequentially
	
**Returns:**
 A shape with pattern on it