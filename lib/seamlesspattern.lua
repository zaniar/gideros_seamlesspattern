--[[

 Bismillahirahmanirrahim
 
 Seamless Pattern
 by: Edwin Zaniar Putra (zaniar@nightspade.com)

 Copyright © 2012 Nightspade (http://nightspade.com).
 All Rights Reserved.
 
--]]

SeamlessPattern = Core.class(Sprite)

function SeamlessPattern:init(path, speedX, speedY)
	self.texture = Texture.new(path, true, {wrap = Texture.REPEAT})
	self.speedX = speedX
	self.speedY = speedY
	
	self.matrix = Matrix.new()
	self.shape = Shape.new()
	
	self:addChild(self.shape)
	
	if self.speedX == 0 and self.speedY == 0 then
		self:draw()
	else
		self:addEventListener(Event.ENTER_FRAME, self.draw, self)
		self:addEventListener(Event.REMOVED_FROM_STAGE, self.removed, self)
	end
end

function SeamlessPattern:draw(evt)
	local tx = self.matrix:getTx()+self.speedX
	local ty = self.matrix:getTy()+self.speedY
	
	if tx > self.texture:getWidth() then tx = tx - self.texture:getWidth() end
	if ty > self.texture:getHeight() then ty = ty - self.texture:getHeight() end
	
	self.matrix:setTx(tx)
	self.matrix:setTy(ty)
	self.shape:clear()
	self.shape:setFillStyle(Shape.TEXTURE, self.texture, self.matrix)
	self.shape:beginPath()
	self.shape:moveTo(-application:getContentOffsetWidth(), -application:getContentOffsetHeight())
	self.shape:lineTo(application:getContentWidth()+application:getContentOffsetWidth(), -application:getContentOffsetHeight())
	self.shape:lineTo(application:getContentWidth()+application:getContentOffsetWidth(), application:getContentHeight()+application:getContentOffsetHeight())
	self.shape:lineTo(-application:getContentOffsetWidth(), application:getContentHeight()+application:getContentOffsetHeight())
	self.shape:closePath()
	self.shape:endPath()
end

function SeamlessPattern:removed(evt)
	self:removeEventListener(Event.ENTER_FRAME, self.draw, self)
end