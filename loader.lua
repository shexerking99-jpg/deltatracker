-- HEHE Loader
local GITHUB_USER = "shexerking99"
local GITHUB_REPO = "deltatracker"
local GITHUB_TOKEN = "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"
local SCRIPT_PATH = "script.lua"

local url = "https://api.github.com/repos/" .. GITHUB_USER .. "/" .. GITHUB_REPO .. "/contents/" .. SCRIPT_PATH .. "?ref=main"

local res = request({
    Url = url,
    Method = "GET",
    Headers = {
        ["Authorization"] = "token " .. GITHUB_TOKEN,
        ["User-Agent"] = "HEHE",
        ["Accept"] = "application/vnd.github.v3+json",
    },
})

if not res or not res.Body then
    warn("[HEHE] loader: no response")
    return
end

local decoded = game:GetService("HttpService"):JSONDecode(res.Body)
if not decoded.content then
    warn("[HEHE] loader: no content")
    return
end

-- base64 decode
local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local data = decoded.content:gsub("%s", ""):gsub('[^'..b..'=]', '')
local source = (data:gsub('.', function(x)
    if x == '=' then return '' end
    local r, f = '', (b:find(x) - 1)
    for i = 6, 1, -1 do r = r .. (f % 2^i - f % 2^(i-1) > 0 and '1' or '0') end
    return r
end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
    if #x ~= 8 then return '' end
    local c = 0
    for i = 1, 8 do c = c + (x:sub(i,i) == '1' and 2^(8-i) or 0) end
    return string.char(c)
end))

local fn, err = loadstring(source)
if not fn then
    warn("[HEHE] loader: compile error: " .. tostring(err))
    return
end

local ok, runErr = pcall(fn)
if not ok then
    warn("[HEHE] loader: runtime error: " .. tostring(runErr))
end
