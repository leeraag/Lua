--работа со сценами
local composer = require("composer")
local scene = composer.newScene()-- объявление сцены

-- контент перед визуализацией сцены, все графические компоненты, аудио компоненты
function scene:create( event )
    local sceneGroup = self.view
    display.setDefault("background", 1, 0, 0)

    --textbox и его параметры
    local TextBox = native.newTextBox(160, 80, 250, 150)
    TextBox.font = native.newFont("Helvetica", 20)--шрифт
    TextBox:setTextColor(0, 0, 0)--цвет шрифта
    TextBox.text = "Красная шапочка привела колобка к лисе, она его съела"
    TextBox.isEditable = false--разрешение на редактирование поляя

    local widget = require "widget"
    local function ButtonClick() 
        print("+2")
        push()
        return true --факт сработки нажатия
    end
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
