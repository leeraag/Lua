--работа со сценами
local composer = require("composer")
local scene = composer.newScene()-- объявление сцены

-- контент перед визуализацией сцены, все графические компоненты, аудио компоненты
function scene:create( event )
    local sceneGroup = self.view
    display.setDefault("background", 1, 0, 0)

    --textbox и его параметры
    local TextBox4 = native.newTextBox(160, 80, 250, 150)
    TextBox4.font = native.newFont("Helvetica", 20)--шрифт
    TextBox4:setTextColor(0, 0, 0)--цвет шрифта
    TextBox4.text = "Красная шапочка не любит, когда от неё бегают. Она догнала и съела колобка"
    TextBox4.isEditable = false--разрешение на редактирование поляя

    local widget = require "widget"
    sceneGroup:insert(TextBox4)
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
        composer.removeScene("scene4")
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