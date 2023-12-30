screen = {}
    screen.width = 800
    screen.height = 600
    screen.title = "Cursor Game"
    function screen.init()
        love.window.setMode(screen.width, screen.height)
        love.window.setTitle(screen.title)
    end

mouse = {}
    mouse.x = 0
    mouse.y = 0
    function mouse.update()
        mouse.x = love.mouse.getX()
        mouse.y = love.mouse.getY()
    end

function exportScore(score)
    --open or reopen and add line with the score:
    -- generate sentense with the date and the hour
    -- generate sentense with the score
    local file = io.open("score.txt", "a")
    io.output(file)
    io.write(os.date("%d/%m/%Y %H:%M:%S") .. " : " .. math.floor(score) .. "\n")
end