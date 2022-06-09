--[[
    Starting screen of the game
]]

TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:init()
    -- nothing in the init function
end

function TitleScreenState:update(dt)
    -- if enter or return was pressed, change the state to countdown
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function TitleScreenState:render()
    -- display title screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Flappy Bird!', 0, 150, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(mediumFont)
    love.graphics.printf('Press Enter to Play', 0, 190, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Annie Cai', -10, 5, VIRTUAL_WIDTH, 'right')

    -- display the rules
    love.graphics.setFont(smallFont)
    love.graphics.printf('Press Space to Jump', 0, 210, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Press Escape to Exit', 0, 220, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Press P to Pause', 0, 230, VIRTUAL_WIDTH, 'center')
end