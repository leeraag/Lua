-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local phisics = require "physics"
phisics.start()

local BorderTop = display.newLine(0, 0, 650, 1)
BorderTop:setStrokeColor(0, 0, 0, 0.1)
phisics.addBody(BorderTop, "static")

local BorderLeft = display.newLine(0, 0, 1, 1050)
BorderLeft:setStrokeColor(0, 0, 0, 0.1)
phisics.addBody(BorderLeft, "static")

local BorderRight = display.newLine(650, 0, 1, 1050)
BorderRight:setStrokeColor(0, 0, 0, 0.1)
phisics.addBody(BorderRight, "static")

local Background = display.newRect(0, 0, 650, 1050)
Background.fill = {type = "image", filename = "sky.png"}

--local BorderDown = display.newLine(0, 1050, 650, 1)
--BorderDown:setStrokeColor(0, 0, 0, 0.1)
--phisics.addBody(BorderDown, "static")


local MyCircle = display.newCircle(150, 325, 20)
phisics.addBody(MyCircle, "dinamic")
MyCircle.fill = {type = "image", filename = "ball.png"}

local RectLeft = display.newRect(10, 450, 260, 50)
RectLeft:rotate(45)
phisics.addBody(RectLeft, "static")
--RectLeft.fill = {type = "image", filename = "fan.png"}

local RectRight = display.newRect(310, 450, 260, 50)
RectRight:rotate(-45)
phisics.addBody(RectRight, "static")
--RectRight.fill = {type = "image", filename = "fan.png"}

local pl1 = display.newRect(0, 75, 300, 20)
phisics.addBody(pl1, "static")
pl1.fill = {type = "image", filename = "grass.png"}
local pl2 = display.newRect(240, 180, 150, 20)
phisics.addBody(pl2, "static")
pl2.fill = {type = "image", filename = "grass.png"}
local pl3 = display.newRect(0, 320, 300, 20)
phisics.addBody(pl3, "static")
pl3.fill = {type = "image", filename = "grass.png"}

local function pushLeft()
    MyCircle:applyLinearImpulse(-0.1, -0.1, MyCircle.x, MyCircle.y)
end
local function pushRight()
    MyCircle:applyLinearImpulse(0.1, -0.1, MyCircle.x, MyCircle.y)
end

 RectRight:addEventListener("tap", pushLeft)
 RectLeft:addEventListener("tap", pushRight)