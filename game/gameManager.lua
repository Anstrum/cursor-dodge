game = {}

    game.player = nil
    game.shoots = nil
    game.hud = nil
    game.settings = nil


    game.globalStats = {
        gameSpeed = 1,
        score = 0,
        time = 0,
    }


function game.init()
    game.settings = require("misc/settings")
    game.player = require("game/player/player")
    game.shoots = require("game/shoots/shoots")
    game.hud = require("game/hud")


    game.player.init(game.settings.hp, game.settings.cursor)
    game.shoots.init(game.settings.shoot)
    game.hud.init(game.settings.hud)
    
    require("misc/utils")
end

function game.update(dt)
    game.updateTimer(dt)
    game.updateScore(dt)
    game.updateGameSpeed(dt)


    game.shoots.update(dt)
    game.player.update(dt)
end

function game.keypressed(key)
end

function game.draw()
    game.shoots.draw()
    game.player.draw()
    game.hud.draw()
end