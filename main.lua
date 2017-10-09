function love.load()
   hatSource = love.audio.newSource(love.sound.newSoundData("hat.wav"))
   --hatSource:setLooping(true)
   hatSource:setVolume(0.5)
   tickDuration = 1 / 240
   love.audio.play(hatSource)
   boopSource = love.audio.newSource(love.sound.newSoundData("g1s-2.wav"))
end
-- 3857
function love.update(dt)
-- inbetween tick math
    if (boopShouldPlay and not boopSource:isStopped()) then
        tellVal = boopSource:tell("samples")
        if (tellVal > 18138) then
            --[[while (tellVal > 18137 + 17074) do
                tellVal = tellVal - (18137 - 17074);
            end]]
            boopSource:seek(17073 + (tellVal - 18138), "samples")
        end
    end
    -- tick math
    if (hatSource:isStopped()) then
        if (boopShouldPlay and boopSource:isStopped()) then
            love.audio.play(boopSource)
        end
        love.audio.play(hatSource)
    end
    love.timer.sleep(tickDuration - dt);
end

function love.draw()
    love.graphics.print("Hello World", 400, 300)
end

function love.keypressed(key, scancode, isrepeat)
    if (key == "a") then
        boopSource:stop();
        boopSource:seek(0, "samples");
        boopShouldPlay = true
    end 
end

function love.keyreleased(key, scancode)
    if (key == "a") then
        boopShouldPlay = false
    end 
end