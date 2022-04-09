local physics = require("physics")
physics.start()

local background = display.newRect(160, 250, 350, 700)
background:setFillColor(0, 1, 0, 1)

local step = 0
local recordStep = 100000

local numOfSteps = display.newText("Шаги:", 30, 0, "Helvetica", 20)
local numberOfSteps = display.newText(step, 80, 0, "Helvetica", 20)
local numOfRecordSteps = display.newText("Шаги:", 210, 0, "Helvetica", 20)
local numberOfRecordSteps = display.newText(recordStep, 270, 0, "Helvetica", 20)

local circle = display.newCircle(160, 480, 30)
circle:setFillColor(1, 0, 0, 1)
physics.addBody(circle, "dinamic")
circle.gravityScale = 0

local finish = display.newCircle(160, 0, 30)
finish:setFillColor(0, 1, 1, 1)
physics.addBody(finish, "dinamic")
finish.gravityScale = 0
finish.isSensor = true
finish.ID = "finish"

local function movePers(event)
    local eventx = event.x
    local eventy = event.y
    transition.moveTo(circle, { x = eventx, y = eventy, time = 300 })
    step = step + 1

    numberOfSteps.text = step
end
background:addEventListener("tap", movePers)

local mas = {}
local test = false --false - не надо перереспать объекты

local function spawn()
    for i = 1, 5 do
        local x = math.random(60, 300)
        local y = math.random(60, 430)
        mas[i] = display.newCircle(x, y, 20)
        mas[i]:setFillColor(1, 1, 0, 1)
        physics.addBody(mas[i], "dinamic")
        mas[i].isSensor = true
        mas[i].ID = "bomb"
        mas[i].gravityScale = 0
        --mas[i]:addEventListener("tap", function() test = true end)
    end
end

spawn()

local function clear()
    for i = 1, 5 do
        mas[i]:removeSelf()
        mas[i] = nil
    end
end

local function onUpdate()
    if (test) then
        clear()
        spawn()
        --circle.x = 160
        --circle.y = 480
        test = false
    end
end
Runtime:addEventListener("enterFrame", onUpdate)

local function crash(self, event)
    if (event.phase == "began" and event.other.ID == "bomb") then
        test = true
        --transition.moveTo(circle, { x = 160, y = 480, time = 300 })
        step = 0
    end
    if (event.phase == "began" and event.other.ID == "finish") then
        if (step < recordStep) then
            recordStep = step
        end
        numberOfRecordSteps.text = recordStep
        test = true
        --transition.moveTo(circle, { x = 160, y = 480, time = 300 })
        step = 0
    end
end
circle.collision = crash
circle:addEventListener("collision", circle)