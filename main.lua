io.stdout:setvbuf("no")
love.graphics.setDefaultFilter("nearest")

 --[[
    Current work: creating static bonuses that will help the player surviving
 ]]



require("misc/misc")
require("misc/debug")
require("game/gameManager")


function love.load()
    screen.init()
    game.init()
end


function love.update(dt)
    mouse.update()
    game.update(dt)
end

function love.keypressed(key)
    debug.keypressed(key)
    game.keypressed(key)
end

function love.quit()
    exportScore(game.globalStats.score)
end

function love.draw()
    love.graphics.setColor(1, 1, 1, 1)

    game.draw()

    debug.draw()
end