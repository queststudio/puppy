function _mapState(state)
    if state == 1 then
        return 'solved'
    elseif state == 0 then
        return 'not solved'
    else
        return 'unknown'
    end
end

function getDevices(range, isThere, read)
    local result = {}
    local from, to = range()
    for i=from, to do
        if isThere(i, 1) then
            local message = read(i, 1)
            result[i] = _mapState(message)
        end
    end
    return result
end

return {
    getDevices = getDevices
}
