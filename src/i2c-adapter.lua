i2c = require("i2c")
    
function _isThere(i2c, id, address, length)
    i2c.start(id)
    local isThere = i2c.address(id, address, i2c.RECEIVER)
    i2c.read(id, length)
    i2c.stop(id)
    return isThere
end

function _read(i2c, id, address, length)
    i2c.start(id)
    i2c.address(id, address, i2c.RECEIVER)
    local message = i2c.read(id, length)
    i2c.stop(id)
    return message
end

function _range()
    return 1, 127
end

function start(scl, sda)
    local id = 0
    local speed = i2c.SLOW
    
    i2c.setup(id, sda, scl, speed)
    
    local isThere = function(address, length)
        return _isThere(i2c, id, address, length)
    end
    local read = function(address, length)
        return _read(i2c, id, address, length)
    end

    return _range, isThere, read
end


return {
    start = start
}
