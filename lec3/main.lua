local physics = require ("physics")
physics.start()

local myRec = display.newRect(160, 250, 350, 700)
myRec:setFillColor(255, 0, 255)

local seetOptions = 
{
    width = 800,
    height = 800,
    numFrames = 4
}
local imageSheet = graphics.newImageSheet("Sprite.png", seetOptions)

local sequenceData = 
{
    name = "bebe",
    start = 1,
    count = 4,
    time = 500,
    -- 0 повторяет бесконечно
    loopCount = 0,
    loopDirection = "forward"
}

local character = display.newSprite(imageSheet, sequenceData)

--physics.addBody(character, "dynamic")
character.x = 160
character.y = 100
-- масштаб по x и y
character:scale(0.3, 0.3)
character:play()

local function MoveOB(event)
    if (event.phase == "began") then
        -- body
        display.currentStage:setFocus(character)
        --смещение относительно объекта
        character.touchOfSetX = event.x - character.x
        character.touchOfSetY = event.y - character.y

    end
    if (event.phase == "moved") then
        -- body
        character.x = event.x - character.touchOfSetX
        character.y = event.y - character.touchOfSetY
    end
    if (event.phase == "ended") then
        -- body
        display.currentStage:setFocus(nil)
    end
end
character:addEventListener("touch", MoveOB)