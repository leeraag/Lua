--работа со сценами
local composer = require("composer")
local scene = composer.newScene()-- объявление сцены

function generationButton(text, scene)
    local widget = require "widget"

    Button = widget.newButton {
        label = text,
        shape = "rect",--форма
        fillColor = {default = {1, 1, 1}, over={0.8, 0.8, 0.8}}, --цвет: по умолчанию, и при нажатии
        labelColor = {default = {0, 0, 0}, over={0.5, 0.5, 0.5}},--цвет текста
        fontSize = 20,
        width = 200, height = 50, 
        onRelease = function() composer.gotoScene(scene) end
    }
    return Button
end

-- контент перед визуализацией сцены, все графические компоненты, аудио компоненты
function scene:create( event )
    local sceneGroup = self.view
    display.setDefault("background", 1, 0, 0)

    --textbox и его параметры
    local TextBox = native.newTextBox(160, 80, 250, 150)
    TextBox.font = native.newFont("Helvetica", 20)--шрифт
    TextBox:setTextColor(0, 0, 0)--цвет шрифта
    TextBox.text = "Выберете тропинку"
    TextBox.isEditable = false--разрешение на редактирование поляя

    Button31 = generationButton ("Пойти направо", "scene4")
    Button31.x = 150
    Button31.y = 350

    Button32 = generationButton ("Пойти налево", "scene4")
    Button32.x = 150
    Button32.y = 450

    sceneGroup:insert(Button31)--добавление объектов в сцену
    sceneGroup:insert(Button32)--добавление объектов в сцену
    sceneGroup:insert(TextBox)
end
-- визуализация сцены, события при отображении и работы сцены
function scene:show( event ) 
    if (event.phase == "will") then --перед первой загрузкой
        --при переходе из первой о вторую сцену, нужно первую сцену удалить
        composer.removeScene("scene1")
    end
end
-- вызывется при сворачивании или закрытии сцены: снять прослушиватели, остановить физику
function scene:hide( event )   
    if (event.phase == "did") then --когда сцена уже закрыта
        --Button1:removeSelf()
        --Button2 = nil
        composer.removeScene("scene2")
    end
end
-- очищение сцены из ОП
function scene:destroy( event )
end

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene
