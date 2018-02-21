function getDevices(range, isThere, read)
    local result = {}
    local from, to = range()
    for i=from, to do
        if isThere(i, 1) then
            result[i] = read(i, 1)
        end
    end
    return result
end

return {
    getDevices = getDevices
}