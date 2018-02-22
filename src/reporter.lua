function length(t)
  local count = 0
  for _ in pairs(t) do count = count + 1 end
  return count
end

function start(reporterId)
    return function (devices)
        print('Found devices: ' .. length(devices))
        for address, state in pairs(devices) do
            print('[' .. reporterId..'] ' .. address .. ': ' .. state)
        end
    end
end

return {
    start = start
}
