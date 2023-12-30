local cursor = {}

    cursor.stats = {
        size = 5,
        invincibilityTime = 0,
    }
    
    cursor.settings = {
        addInvincibilityTime = 1
    }

    function cursor.init(settings)
        cursor.settings = settings

        cursor.stats.invincibilityTime = 0
        cursor.stats.size = cursor.settings.size

        love.mouse.setVisible(false)
    end

    function cursor.update(dt)
        cursor.stats.invincibilityTime = cursor.stats.invincibilityTime - 1 * dt
        if cursor.stats.invincibilityTime < 0 then
            cursor.stats.invincibilityTime = 0
        end
    end

    function cursor.addInvincibility()
        if cursor.stats.invincibilityTime <= 0 then
            cursor.stats.invincibilityTime = cursor.settings.addInvincibilityTime
        end
    end


    function cursor.draw()
        if cursor.stats.invincibilityTime > 0 then
            love.graphics.setColor(1, 1, 1, 1)
        else
            love.graphics.setColor(0, 1, 0, 1)
        end
        love.graphics.circle("fill", mouse.x, mouse.y, cursor.stats.size)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.circle("line", mouse.x, mouse.y, cursor.stats.size + 1)
    end

return cursor