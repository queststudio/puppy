function length(t)
  local count = 0
  for _ in pairs(t) do count = count + 1 end
  return count
end

function report(reporterId, address, state)
    print('[' .. reporterId..'] ' .. address .. ': ' .. string.byte(state))
end

function reportAll(reporterId, devices)
    print('Found devices: ' .. length(devices))
    for address, state in pairs(devices) do
        report(reporterId, address, state)
    end
end

return {
    report = report,
    reportAll = reportAll
}