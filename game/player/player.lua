local player = {}

player.hp = nil
player.cursor = nil

function player.init(hpSettings, cursorSettings)
    player.cursor = require("game/player/cursor")
    player.hp = require("game/player/hp")

    player.hp.init(hpSettings)
    player.cursor.init(cursorSettings)
end

function player.update(dt)
    player.cursor.update(dt)
    player.hp.update(dt)
end


function player.draw()
    player.cursor.draw()
end


return player