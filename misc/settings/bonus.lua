--[[
    BONUS SETTINGS
        - bonus spawn delay
        - duration time
        - size of the bonus
        - bonus speed (if moving)

    BONUS TYPES
        - max hp boost
        - regen boost
        - flat heal
        - damage reduction
        - invincibility time
]]


local bonusSettings = {
    -- delay --
    minSpawnDelay = 0.1,
    maxSpawnDelay = 1,

    -- duration --
    minBonusDuration = 0.1,
    maxBonusDuration = 1,

    -- size --
    minBonusSize = 10,
    maxBonusSize = 30,

    -- speed --
    minBonusSpeed = 10,
    maxBonusSpeed = 30,

    -- max hp bonus --
    minBonusHp = 10,
    maxBonusHp = 30,

    -- regen boost --
    minBonusHpRegenMultiplicator = 1,
    maxBonusHpRegenMultiplicator = 5,

    -- flat heal --
    minBonusHeal = 10,
    maxBonusHeal = 100,

    -- damage reduction --
    minBonusDamageReductionMultiplicator = 0.1,
    maxBonusDamageReductionMultiplicator = 1,

    -- invincibility time --
    minBonusInvincibilityTimeMultiplicator = 1,
    maxBonusInvincibilityTimeMultiplicator = 5
}

return bonusSettings