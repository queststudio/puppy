local i2cAdapter = require("i2c-adapter")
local bus = require("bus")
local identity = require("identity")
local reporter = require("reporter")
    
print("Starting I2C... ")
local reporterId = identity.get()
local scl = 2 
local sda = 1
local range, isThere, read = i2cAdapter.start(scl, sda)
local reportAll = reporter.reportAll


function isThereStub(address)
    if address < 15 then
        return true
    else
        return false
    end
end

tmr.alarm(1, 1000, 1, function()
    local devices = bus.getDevices(range, isThereStub, read)
    reportAll(reporterId, devices)
end)
