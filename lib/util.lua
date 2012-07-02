--[[

 Bismillahirahmanirrahim
 
 Utility
 by: Edwin Zaniar Putra (zaniar@nightspade.com)
 
 This code is MIT licensed, see http://www.opensource.org/licenses/mit-license.php
 Copyright © 2012 Nightspade (http://nightspade.com).
 
--]]

-- short alias for application
app = application

function application:getLogicalOffsetWidth()
	return application:getLogicalTranslateX()/application:getLogicalScaleX()
end

function application:getLogicalOffsetHeight()
	return application:getLogicalTranslateY()/application:getLogicalScaleY()
end

function application:getContentOffsetWidth() 
	local orientation = application:getOrientation()
	if orientation == application.PORTRAIT or orientation == application.PORTRAIT_UPSIDE_DOWN then
		return application:getLogicalTranslateX()/app:getLogicalScaleX()
	else 
		return application:getLogicalTranslateY()/app:getLogicalScaleY()
	end
end

function application:getContentOffsetHeight()
	local orientation = application:getOrientation()
	if orientation == application.PORTRAIT or orientation == application.PORTRAIT_UPSIDE_DOWN then
		return application:getLogicalTranslateY()/application:getLogicalScaleY()
	else 
		return application:getLogicalTranslateX()/application:getLogicalScaleX()
	end
end

function vardump(value, depth, key)
  local linePrefix = ""
  local spaces = ""
  local mTable = nil
  
  if key ~= nil then
    linePrefix = "["..key.."] = "
  end
  
  if depth == nil then
    depth = 0
  else
    depth = depth + 1
    for i=1, depth do spaces = spaces .. "  " end
  end
  
  if type(value) == 'table' then
    mTable = getmetatable(value)
    if mTable == nil then
      print(spaces ..linePrefix.."(table) ")
    else
      print(spaces .."(metatable) ")
        value = mTable
    end		
    for tableKey, tableValue in pairs(value) do
      vardump(tableValue, depth, tableKey)
    end
  elseif type(value)	== 'function' or 
      type(value)	== 'thread' or 
      type(value)	== 'userdata' or
      value		== nil
  then
    print(spaces..tostring(value))
  else
    print(spaces..linePrefix.."("..type(value)..") "..tostring(value))
  end
end