package.path = "../tools/?.lua"
require "common"

function CsvToluaTable(preName)
    local csvFileName = "csv\\" .. preName .. ".csv"
    local luaFileName = "lua\\" .. preName .. ".lua"
    local csvFile = io.open(csvFileName, "r")
    local luaFile = io.open(luaFileName, "w")
    local index = 0
    local conts = {}
    local name = {}
    local elementType = {}
    local bstringkey = false
    
    luaFile:write("local cfg_" .. preName .. " = {" .. lineBreak())
    for csvFileLine in csvFile:lines() do
        index = index + 1
        if index > 0 then
            if index == 1 then
                conts = splitString(csvFileLine, ",")
                if conts[1] == "IDSTRING" then
                    bstringkey = true
                else
                    bstringkey = false
                end
            elseif index == 2 then
                elementType = splitString(csvFileLine, ",")
            elseif index == 3 then
                name = splitString(csvFileLine, ",")
            else
                local elementData = splitString(csvFileLine, ",")
                local bl = true
                for k, v in pairs(elementData) do   
                    if elementType[k] == "index" then
                        if v == "\"\"" then
                            bl = false
                            break
                        end
                        if bstringkey then
                            luaFile:write("[" .. v .. "] = {")
                            luaFile:write(name[k] .. "=" .. "\"" .. v .. "\"" .. ",")
                        else
                            luaFile:write("[" .. v .. "] = {")
                            luaFile:write(name[k] .. "=" .. v .. ",")
                        end
                    elseif elementType[k] == "key" then
                        if v == "" then
                            bl = false
                            break
                        end
                        luaFile:write("[" .. v .. "] = {")
                        luaFile:write(name[k] .. "=" .. v .. ",")
                    elseif elementType[k] == "byte" then
                        if v == "" then
                            v = 0
                        end
                        luaFile:write(name[k] .. "=" .. v .. ",")
                    elseif elementType[k] == "short" then
                        if v == "" then
                            v = 0
                        end
                        luaFile:write(name[k] .. "=" .. v .. ",")
                    elseif elementType[k] == "int" then
                        if v == "" then
                            v = 0
                        end
                        luaFile:write(name[k] .. "=" .. v .. ",")
                    elseif elementType[k] == "float" then
                        if v == "" then
                            v = 0
                        end
                        luaFile:write(name[k] .. "=" .. v .. ",")
                    elseif elementType[k] == "byte[]" then
                        local intData = splitString(v, "|", tonumber)
                        luaFile:write(name[k] .. "= {")
                        for k1, v1 in pairs(intData) do
                           luaFile:write(v1 .. ",") 
                        end
                        luaFile:write("},")
                        elseif elementType[k] == "short[]" then
                        local intData = splitString(v, "|", tonumber)
                        luaFile:write(name[k] .. "= {")
                        for k1, v1 in pairs(intData) do
                           luaFile:write(v1 .. ",") 
                        end
                        luaFile:write("},")
                    elseif elementType[k] == "int[]" then
                        local intData = splitString(v, "|", tonumber)
                        for k1, v1 in pairs(intData) do
                           luaFile:write(v1 .. ",") 
                        end
                        luaFile:write("},")
                    elseif elementType[k] == "list" then
                        luaFile:write(name[k] .. "={")
                        local v1 = string.gsub(v, "|", ",")
                        luaFile:write(v1)
                        luaFile:write("},")
                    elseif elementType[k] == "table" then
                        luaFile:write(name[k] .. "={")
                        local v1 = string.gsub(v, "*", ",")
                        luaFile:write(v1)
                        luaFile:write("},")
                    elseif elementType[k] == "table_string" then
                        luaFile:write(name[k] .. "={")
                        local v1 = string.gsub(v, "*", "\",\"")
                        v1 = "\"" .. v1 .. "\""
                        luaFile:write(v1)
                        luaFile:write("},")
                    elseif elementType[k] == "string" then
                        luaFile:write(name[k] .. "=[[" .. v .. "]],")
                    elseif elementType[k] == "nstring" then
                        luaFile:write(name[k] .. "=[[" .. v .. "]],")
                    elseif elementType[k] == "remark" then
                        luaFile:write(name[k] .. "=[[" .. v .. "]],")
                    else
                    
                    end
                end
                if bl == true then
                    luaFile:write("}," .. lineBreak())
                end  
            end
        end
    end
    luaFile:write("}\n")
    luaFile:write("return cfg_" .. preName)
    
    csvFile:close()
    luaFile:close()
end

function GenLuaTable()
    print("csv to lua table---------------------------begin")
    local initLuaFile = io.open("lua\\configs.lua", "w")
    local files = {}
    local filenames = {}
    getpathes("csv\\", files)
    for _, fname in pairs(files or {}) do
        local tb = splitString(fname, ".")
        assert(#tb > 0)
        local name = tb[1]
        -- initLuaFile:write("require(\"" .. name .. "\")\n")
        print(name)
        CsvToluaTable(name)
        table.insert(filenames, name)
    end
    -- initLuaFile:write("\n")
    initLuaFile:write("local cfgs = {\n")
    for k, v in pairs(filenames) do
        initLuaFile:write("   " .. v .. " = require \"config." .. v .. "\",\n")
    end
    initLuaFile:write("}\n\n")
    initLuaFile:write([[
function cfgs.get(name)
    return cfgs[name]
end

function cfgs.get_line(name, index)
    if not cfgs[name] then
        return nil
    end
    return cfgs[name][index]
end

function cfgs.get_value(name, index, key)
    if not cfgs[name] then
        return nil
    end
    if not cfgs[name][index] then
        return nil
    end
    return cfgs[name][index][key]
end

return cfgs
]]
    )
    initLuaFile:close()
    print("csv to lua table---------------------------end")
end

GenLuaTable()
