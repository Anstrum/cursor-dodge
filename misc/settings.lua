local settings = {}


settings.shoot = {
    minSpeed = 150,
    maxSpeed = 300,
    minSize = 10,
    maxSize = 30,
    minShootDelay = 0.1,
    maxShootDelay = 1
}
settings.hp = {
    barWidth = 100,
    barHeight = 15,
    regen = 1,
    regenBoost = 1,
    damageAmmount = 10,
    damageMultiplicator = 1,
    maxHp = 100
}
settings.cursor = {
    size = 5,
    addInvincibilityTime = 1,
}
settings.hud = {
    drawHpBar = true,
    drawScore = true,
    drawTimer = true,
    
    hpBarWidth = 100,
    hpBarHeight = 15,
}


return settings