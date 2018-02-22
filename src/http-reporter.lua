local http = require("http")


function length(t)
  local count = 0
  for _ in pairs(t) do count = count + 1 end
  return count
end

function _report(baseUrl, reporterId, devices, success, failure)
    local body = '{ "devices": ['
    for address, state in pairs(devices) do
        body = body .. '{ "address": ' .. address .. ', "state": "' .. state .. '" },'
    end
    body = body:sub(1, -2) .. '] }'
    local url = baseUrl .. '/api/reporters/' .. reporterId
    --print(body)
    http.put(url,
    'Content-Type: application/json\r\n',
    body,
    function (status)
        if status == 200 then
            success()
        else
            failure()
        end
    end)
end

function start(baseUrl, reporterId)
    return function (devices)
        if length(devices) > 0 then
            _report(baseUrl, reporterId, devices,
                function()
                end,
                function()
                    print('It wasn\'t possible to report the state')
                end)
        end
    end
end

return {
    start = start
}
