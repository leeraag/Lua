-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local physics = require ("physics")
physics.start()

local Text = display.newText("Счет:", 10, 30, "Helvetica", 25)

local Count = 0
local Score = display.newText(Count, 60, 30, "Helvetica", 25)

local Button = display.newCircle(-10, 300, 50)
physics.addBody(Button, "static")
Button.isSensor = true

local Ball = display.newCircle(60, 0, 20)
physics.addBody(Ball, "dinamic")
Ball.isSensor = true
Ball.gravityScale = 0.5

local function pushBall()
    Ball:applyLinearImpulse(0, -0.1, Ball.x, Ball.y)
end
Button:addEventListener("tap", pushBall)

local function spawn()
    local yUp = math.random(50, 100)
    local yDown = math.random(50, 100)
    local RectUp = display.newRect(600, 240 - yUp - 150, 30, 150)
    physics.addBody(RectUp, "dinamic")
    RectUp:applyLinearImpulse(-0.15, 0, RectUp.x, RectUp.y)
    local RectDown = display.newRect(600, 240 + yDown, 30, 150)
    physics.addBody(RectDown, "dinamic")
    RectDown:applyLinearImpulse(-0.15, 0, RectDown.x, RectDown.y)
    RectUp.gravityScale = 0
    RectDown.gravityScale = 0
    local mySense = display.newRect(600, 240 , 30, yDown - yUp)
    mySense:setFillColor(1, 0, 0, 0.7)
    physics.addBody(mySense, "dinamic")
    local function remove()
        RectUp:removeSelf()
        RectDown:removeSelf()
    end
end

timer.performWithDelay(2000, spawn, 0)