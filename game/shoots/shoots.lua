local shoots = {}


    shoots.stats = {
        list = nil,
        tick = nil,
        delay = nil
    }

    shoots.settings = {
        maxSpeed = nil,
        minSize = nil,
        maxSize = nil,
        minShootDelay = nil,
        maxShootDelay = nil
    }


function shoots.init(settings)
    shoots.settings = settings
    shoots.stats.list = {}

    shoots.stats.tick = 0
    shoots.stats.delay = math.random(shoots.settings.minShootDelay, shoots.settings.maxShootDelay)
end

function  shoots.generateShot()
    local myShoot = {}

    myShoot.ratio = math.random()

    myShoot.speedX = shoots.settings.maxSpeed * myShoot.ratio
    if math.random(0, 1) > 0 then
        myShoot.speedX = myShoot.speedX * - 1
    end
    myShoot.speedY = shoots.settings.maxSpeed * (1 - myShoot.ratio)
    if math.random(0, 1) > 0 then
        myShoot.speedY = myShoot.speedY * - 1
    end

    myShoot.shape = "circle"
    
    myShoot.radius = math.random(shoots.settings.minSize, shoots.settings.maxSize)

    if myShoot.speedX > 0 then
        myShoot.x = - myShoot.radius
    else
        myShoot.x = screen.width + myShoot.radius
    end

    if myShoot.speedY > 0 then
        myShoot.y = - myShoot.radius
    else
        myShoot.y = screen.height + myShoot.radius
    end

    table.insert(shoots.stats.list, myShoot)
end

function shoots.update(dt)

    -- ADD new shoot on tick
    shoots.stats.tick = shoots.stats.tick + 1 * dt * game.globalStats.gameSpeed
    if shoots.stats.tick > shoots.stats.delay then
        shoots.stats.tick = 0
        shoots.stats.delay = math.random(shoots.settings.minShootDelay, shoots.settings.maxShootDelay)
        shoots.generateShot()
    end
    
    -- FOR existing shoots, we calculate collision
    for i = #shoots.stats.list, 1, -1 do
        local myShot = shoots.stats.list[i]
        if myShot.shape == "circle" then
            local distX = math.abs(myShot.x - mouse.x)
            local distY = math.abs(myShot.y - mouse.y)
            if distX + distY < myShot.radius + game.getCursorSize() then
                if game.getInvincibleTime() > 0 then
                    goto continue
                end
                table.remove(shoots.stats.list, i)
                game.takeDamage()
                game.addPlayerInvincibility()
                game.player.cursor.addInvincibility(1)
                goto continue
            end
        end
        ::continue::
        -- NOW we make them move
        if #shoots.stats.list > 0 and i <= #shoots.stats.list then
            shoots.stats.list[i].x = shoots.stats.list[i].x + shoots.stats.list[i].speedX * dt * game.globalStats.gameSpeed / 3
            shoots.stats.list[i].y = shoots.stats.list[i].y + shoots.stats.list[i].speedY * dt * game.globalStats.gameSpeed / 3
            if math.abs(shoots.stats.list[i].x) > screen.width * 2 or math.abs(shoots.stats.list[i].y) > screen.height * 2 then
                table.remove(shoots.stats.list, i)
            end
        end
    end
end

function shoots.draw()
    love.graphics.setColor(1, 0, 0, 1)
    for i = 1, #shoots.stats.list do
        local myShot = shoots.stats.list[i]
        if myShot.shape == "circle" then
            love.graphics.circle("fill", myShot.x, myShot.y, myShot.radius)
        end
    end
end

return shoots