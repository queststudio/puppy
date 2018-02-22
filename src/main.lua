local i2cAdapter = require("i2c-adapter")
local bus = require("bus")
local identity = require("identity")
local consoleReporter = require("reporter")
local networkReporter = require("http-reporter")
    
print("Starting I2C... ")
local reporterId = identity.get()
local baseUrl = 'http://192.168.1.106:8000'
local scl = 2 
local sda = 1
local range, isThere, read = i2cAdapter.start(scl, sda)
local reportToConsole = consoleReporter.start(reporterId)
local reportToNetwork = networkReporter.start(baseUrl, reporterId)

tmr.alarm(1, 2000, 1, function()
    local devices = bus.getDevices(range, isThere, read)
    reportToConsole(devices)
    reportToNetwork(devices)
end)
