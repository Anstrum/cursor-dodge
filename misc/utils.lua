--[[
    This section is designed to create a bunch of functions to manage the game
    Exemple: game.takeDamage(amount) is just a function that will call the hp.takeDamage(amount) function 
    without having to call it directly with super long name.

    Here's the full list of functions below:
    MAIN GAME:
        - game.updateTimer(dt)
        - game.updateScore(dt)
        - game.updateGameSpeed(dt)
    PLAYER:
        - game.takeDamage(amount)
        - game.addPlayerInvincibility()
        - game.getCursorSize()
        - game.getInvincibleTime()
        - game.getHp()
        - game.getHpMax()
]]



-- main game functions
function game.updateTimer(dt)
    game.globalStats.time = game.globalStats.time + dt
end
function game.updateScore(dt)
    game.globalStats.score = game.globalStats.score + game.player.hp.stats.count * dt * game.globalStats.gameSpeed
end
function game.updateGameSpeed(dt)
    game.globalStats.gameSpeed = game.globalStats.gameSpeed + 0.1 * dt
end


-- player functions
function game.takeDamage()
    game.player.hp.takeDamage()
end
function game.addPlayerInvincibility()
    game.player.cursor.addInvincibility()
end
function game.getCursorSize()
    return game.player.cursor.stats.size
end
function game.getInvincibleTime()
    return game.player.cursor.stats.invincibilityTime
end
function game.getHp()
    return game.player.hp.stats.count
end
function game.getHpMax()
    return game.player.hp.stats.max
end