function get()
    return wifi.ap.getmac()
end


return {
    get = get
}