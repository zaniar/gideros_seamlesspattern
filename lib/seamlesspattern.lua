--[[

 Bismillahirahmanirrahim
 
 Seamless Pattern
 by: Edwin Zaniar Putra (zaniar@nightspade.com)
 Version: 2012.09.0

 This code is MIT licensed, see http://www.opensource.org/licenses/mit-license.php
 Copyright © 2012 Nightspade (http://nightspade.com).
 
--]]

SeamlessPattern = Core.class(Shape)

function SeamlessPattern:init(path, properties)
	self.texture = Texture.new(path, true, {wrap = Texture.REPEAT})
	if properties ~= nil then 
		self.properties = properties 
	else
		self.properties = {}
	end
	if self.properties.vertices == nil then
		self.properties.vertices = {
			-application:getContentOffsetWidth(),-application:getContentOffsetHeight(),
			application:getContentWidth()+application:getContentOffsetWidth(), -application:getContentOffsetHeight(),
			application:getContentWidth()+application:getContentOffsetWidth(), application:getContentHeight()+application:getContentOffsetHeight(),
			-application:getContentOffsetWidth(), application:getContentHeight()+application:getContentOffsetHeight()
		}
	end
	if self.properties.speedX == nil then self.properties.speedX = 0 end
	if self.properties.speedY == nil then self.properties.speedY = 0 end
	
	self.matrix = Matrix.new()
	if self.properties.m11 ~= nil then self.matrix:setM11(self.properties.m11) end
	if self.properties.m12 ~= nil then self.matrix:setM12(self.properties.m12) end
	if self.properties.m21 ~= nil then self.matrix:setM21(self.properties.m21) end
	if self.properties.m22 ~= nil then self.matrix:setM22(self.properties.m22) end
	self.shape = Shape.new()

	self:addEventListener(Event.ADDED_TO_STAGE, self.added, self)
end

function SeamlessPattern:draw(evt)
	local tx = self.matrix:getTx()+self.properties.speedX
	local ty = self.matrix:getTy()+self.properties.speedY
	
	if tx > self.texture:getWidth() then tx = tx - self.texture:getWidth() end
	if ty > self.texture:getHeight() then ty = ty - self.texture:getHeight() end
	
	self.matrix:setTx(tx)
	self.matrix:setTy(ty)
	self:clear()
	self:setFillStyle(Shape.TEXTURE, self.texture, self.matrix)
	self:beginPath()
	self:moveTo(self.properties.vertices[1], self.properties.vertices[2])
	for i = 3, #self.properties.vertices, 2 do
		self:lineTo(self.properties.vertices[i], self.properties.vertices[i+1])
	end
	self:closePath()
	self:endPath()
end

function SeamlessPattern:added(evt)
	if self.properties.speedX == 0 and self.properties.speedY == 0 then
		self:draw()
	else
		self:addEventListener(Event.ENTER_FRAME, self.draw, self)
		self:addEventListener(Event.REMOVED_FROM_STAGE, self.removed, self)
	end
end

function SeamlessPattern:removed(evt)
	self:removeEventListener(Event.ENTER_FRAME, self.draw, self)
end