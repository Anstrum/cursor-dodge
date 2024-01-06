local shoots = {}


    shoots.stats = {
        list = nil,
        tick = nil,
        delay = nil
    }

    shoots.settings = {
        minSpeed = nil,
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

    shoots.generateShot()
end

function  shoots.generateShot()
    local myShot = {}

    myShot.angle = math.random() * math.pi * 2 -- this will be the angle of the shot
    myShot.radius = math.random(shoots.settings.minSize, shoots.settings.maxSize)
    myShot.speed = math.random(shoots.settings.minSpeed, shoots.settings.maxSpeed)

    -- random pos is to make sure the shoots won't all go on the center of the screen
    myShot.x = math.random(screen.width * 0.1, screen.width)
    myShot.y = math.random(screen.height * 0.1, screen.height)

    local speedX = 0 - (math.cos(myShot.angle) * myShot.speed)
    local speedY = 0 - (math.sin(myShot.angle) * myShot.speed)

    local outTheScreen = false
    while not outTheScreen do
        myShot.x = myShot.x + speedX 
        myShot.y = myShot.y + speedY

        if math.abs(myShot.x) > screen.width * 1.2 and math.abs(myShot.y) > screen.height * 1.2 then
            outTheScreen = true
        end
    end

    table.insert(shoots.stats.list, myShot)
end

function shoots.update(dt)

    if #shoots.stats.list < 1 then
        return
    end

    shoots.stats.tick = shoots.stats.tick + 1 * dt * game.globalStats.gameSpeed

    -- generating new shoot if the delay is over
    if shoots.stats.tick > shoots.stats.delay then
        shoots.stats.tick = 0
        shoots.stats.delay = math.random(shoots.settings.minShootDelay, shoots.settings.maxShootDelay)
        shoots.generateShot()
    end

    -- calculating shoot collision
    for i = #shoots.stats.list, 1, -1 do
        local myShot = shoots.stats.list[i]
        local distX = math.abs(myShot.x - mouse.x)
        local distY = math.abs(myShot.y - mouse.y)

        if distX + distY < myShot.radius + game.getCursorSize() then

            if game.getInvincibleTime() > 0 then
                break
            end

            table.remove(shoots.stats.list, i)

            game.takeDamage()
            game.addPlayerInvincibility()
            game.player.cursor.addInvincibility(1)
        end
    end

    -- updating shoot position
    for i = #shoots.stats.list, 1, -1 do
        local myShot = shoots.stats.list[i]

        local speedX = (math.cos(myShot.angle) * myShot.speed * dt * game.globalStats.gameSpeed)
        local speedY = (math.sin(myShot.angle) * myShot.speed * dt * game.globalStats.gameSpeed)

        myShot.x = myShot.x + speedX
        myShot.y = myShot.y + speedY

        if math.abs(myShot.x) > screen.width * 2 and math.abs(myShot.y) > screen.height * 2 then
            table.remove(shoots.stats.list, i)
        end
    end
end

function shoots.draw()
    love.graphics.setColor(1, 0, 0, 1)
    print("test")
    for i = 1, #shoots.stats.list do
        local myShot = shoots.stats.list[i]
        love.graphics.circle("fill", myShot.x, myShot.y, myShot.radius)
    end
end

return shoots