--[[
    Displays the players score before they transition back to the play state.
    Occurs after the play state has ended.
]]

ScoreState = Class{__includes = BaseState}

function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- if enter or return is pressed, go back to play state
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- display game over message
    love.graphics.setFont(flappyFont)
    love.graphics.printf("Game Over!", 0, 150, VIRTUAL_WIDTH, 'center')

    -- display the player's score
    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 180, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 200, VIRTUAL_WIDTH, 'center')
end