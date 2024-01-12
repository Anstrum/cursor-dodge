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
    game.keypressed(key)
    debug.keypressed(key)
end

function love.quit()
    exportScore(game.globalStats.score)
end

function love.draw()
    -- reset color to white and full alpha --
    love.graphics.setColor(1, 1, 1, 1)

    -- here's begin the drawing of the game --
    game.draw()

    -- Debug must be drawn last --
    debug.draw()
end