local hud = {}

hud.stats = {
    drawHpBar = nil,
    drawScore = nil,
    drawTimer = nil,
}
hud.settings = {
    drawHpBar = nil,
    drawScore = nil,
    drawTimer = nil,

    hpBarWidth = nil,
    hpBarHeight = nil,
}

function hud.init(settings)
    hud.settings = settings

    hud.stats.drawHpBar = hud.settings.drawHpBar
    hud.stats.drawScore = hud.settings.drawScore
    hud.stats.drawTimer = hud.settings.drawTimer
end

function hud.draw()
    if hud.stats.drawHpBar then
        hud.drawHpBar()
    end
    if hud.stats.drawScore then
        hud.drawScore()
    end
    if hud.stats.drawTimer then
        hud.drawTimer()
    end
end

function hud.drawHpBar()
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", 5, 5, 5 + hud.settings.hpBarWidth, 5 + hud.settings.hpBarHeight)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.rectangle("fill", 4, 4, hud.settings.hpBarWidth + 2, hud.settings.hpBarHeight + 2)
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.rectangle("fill", 5, 5, game.getHp() / game.getHpMax() * hud.settings.hpBarWidth, hud.settings.hpBarHeight)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.print("HP: "..math.floor(game.getHp()).." / "..game.getHpMax(), 10, 5)
end

function hud.drawScore()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print("Score: ".. math.floor(game.globalStats.score), 4, 25)
end

function hud.drawTimer()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print("Time: ".. math.floor(game.globalStats.time).."s", 4, 45)
end

return hud