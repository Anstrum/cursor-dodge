debug = {}
    
    debug.displayHitBoxes = false
    debug.hitboxDisplayKey = "f8"


function debug.init()
    debug.displayHitBoxes = true
end


function debug.keypressed(key)
    if key == debug.hitboxDisplayKey then
        debug.displayHitBoxes = not debug.displayHitBoxes
    end
end

function debug.draw()
end