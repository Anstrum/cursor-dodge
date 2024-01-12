game = {}

    game.player = nil
    game.shoots = nil
    game.bonus = nil
    game.hud = nil

    game.settings = {
        game = nil,
        hp = nil,
        cursor = nil,
        shoot = nil,
        bonus = nil,
        hud = nil,
    }

    game.globalStats = {
        gameSpeed = 1,
        score = 0,
        time = 0,
    }


function game.init()
    -- adding all settings --
    game.settings.game = require("misc/settings/game") -- empty for now
    game.settings.hp = require("misc/settings/hp")
    game.settings.cursor = require("misc/settings/cursor")
    game.settings.shoot = require("misc/settings/shoot")
    game.settings.bonus = require("misc/settings/bonus")
    game.settings.hud = require("misc/settings/hud")

    game.player = require("game/player/player")
    game.shoots = require("game/shoots/shoots")
    game.bonus = require("game/bonus/bonus")
    game.hud = require("game/hud/hud")

    game.player.init(game.settings.hp, game.settings.cursor)
    game.shoots.init(game.settings.shoot)
    game.bonus.init(game.settings.bonus)
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