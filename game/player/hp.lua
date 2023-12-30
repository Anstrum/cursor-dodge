local hp = {}

    hp.stats = {
        count = nil,
        max = nil,
        regen = nil,
        regenBoost = nil
    }

    hp.settings = {
        regen = 1,
        regenBoost = 1,
        damageAmmount = 10,
        damageMultiplicator = 1,
        maxHp = 100
    }

function hp.init(settings)
    print(settings.maxHp)
    hp.settings = settings

    hp.stats.count = hp.settings.maxHp
    hp.stats.max = hp.settings.maxHp
    hp.stats.regen = hp.settings.regen
    hp.stats.regenBoost = hp.settings.regenBoost
end

function hp.update(dt)
    if hp.stats.count < hp.stats.max then 
        hp.stats.count = hp.stats.count + (hp.stats.regen * hp.stats.regenBoost) * dt
    else
        hp.stats.count = hp.stats.max
    end
end

function hp.takeDamage()
    hp.stats.count = hp.stats.count - hp.settings.damageAmmount * hp.settings.damageMultiplicator
    if hp.stats.count < 0 then
        love.event.quit()
    end
end


return hp