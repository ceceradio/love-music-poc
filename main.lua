function love.load()
   soundData = love.sound.newSoundData("hat.wav")
   hatSource = love.audio.newSource(soundData)
   love.audio.play(hatSource)
end

function love.update(dt)
   -- tick math
end

function love.draw()
    love.graphics.print("Hello World", 400, 300)
end

