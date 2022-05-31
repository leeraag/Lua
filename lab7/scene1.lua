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
    display.setDefault("background", 0, 1, 0)

    local widget = require "widget"

    local TextBox1 = native.newTextBox(160, 80, 250, 150)
    TextBox1.font = native.newFont("Helvetica", 20)--шрифт
    TextBox1:setTextColor(0, 0, 0)--цвет шрифта
    TextBox1.text = "Ушел колобок от бабушки.\nИдет по лесу, встретил красную шапочку.\nЧто делать колобку?"
    TextBox1.isEditable = false--разрешение на редактирование поля

    Button11 = generationButton ("Идти с ней молча", "scene2")
    Button11.x = 150
    Button11.y = 250
    Button12 = generationButton ("Убежать", "scene3")
    Button12.x = 150
    Button12.y = 350
    Button13 = generationButton ("Поговорить", "scene2")
    Button13.x = 150
    Button13.y = 450
    sceneGroup:insert(Button11)--добавление объектов в сцену
    sceneGroup:insert(Button12)--добавление объектов в сцену
    sceneGroup:insert(Button13)
    sceneGroup:insert(TextBox1)
end
-- визуализация сцены, события при отображении и работы сцены
function scene:show( event ) 
    if (event.phase == "will") then --перед первой загрузкой
        composer.removeScene("scene2")
    end
end
-- вызывется при сворачивании или закрытии сцены: снять прослушиватели, остановить физику
function scene:hide( event )   
    if (event.phase == "did") then --когда сцена уже закрыта
        composer.removeScene("scene1")
        Button = nil
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