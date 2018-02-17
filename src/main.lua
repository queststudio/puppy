i2c = require("i2c")
local id = 0
local address = 7
local scl = 5
local sda = 4
local speed = i2c.SLOW

print("Starting I2C... ")

i2c.setup(id, sda, scl, speed)

function isThere(address)
    i2c.start(id)
    local isThere = i2c.address(id, address, i2c.RECEIVER)
    i2c.stop(id)
    return isThere
end

function read(address, length)
    i2c.start(id)
    i2c.address(id, address, i2c.RECEIVER)
    local message = i2c.read(id, length)
    i2c.stop(id)
    return message
end

tmr.alarm(1, 1000, 1, function()
    for i=0,127 do
        local isPresent = isThere(i)
        local state = read(i, 1)
        print(i .. ': ' .. tostring(isPresent) .. ' - ' .. string.byte(state))
    end
end)