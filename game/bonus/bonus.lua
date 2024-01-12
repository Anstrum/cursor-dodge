local bonus = {}

    --[[

        for now bonus won't move so we will not have to deal with that.

    ]]



    bonus.list = nil -- list of all bonus
    bonus.settings = nil -- settings of the bonus
    bonus.actives = nil -- list of all active bonus
    bonus.spawned = nil -- list of all spawned bonus
    
    function bonus.init(settings)
        bonus.settings = settings

        bonus.actives = {}
        bonus.list = {}
        bonus.spawned = {}        
    end
    
    funciton bonus.update(dt)
        -- update all spawned bonus --
        for i = #bonus.spawned, 1, -1 do
            local currentBonus = bonus.spawned[i]
            currentBonus
        end

        -- update all active bonus --
        for i = #bonus.actives, 1, -1 do
            bonus.actives[i].update(dt)
        end
    end
return bonus