--[[
    Displays (3,2,1) onto the screen as a countdown.
    Transitions to play state once the countdown is complete.
]]

CountdownState = Class{__includes = BaseState}

-- set the countdown time
COUNTDOWN_TIME = 0.75

function CountdownState:init()
    self.timer = 0
    self.count = 3
end

function CountdownState:update(dt)
    self.timer = self.timer + dt

    -- count down from 3 
    if self.timer > COUNTDOWN_TIME then
        self.timer = self.timer % COUNTDOWN_TIME
        self.count = self.count - 1
    end

    -- once countdown ends, change state to play
    if self.count == 0 then
        gStateMachine:change('play')
    end
end

function CountdownState:render()
    -- display the countdown
    love.graphics.setFont(hugeFont)
    love.graphics.printf(tostring(self.count), 0, 170, VIRTUAL_WIDTH, 'center')
end