package.path = "../tools/?.lua"
require "common"

function csvToJson(preName)
    local csvFileName = "csv\\" .. preName .. ".csv"
    local jsonFileName = "json\\" .. preName .. ".json"
    local csvFile = io.open(csvFileName, "r")
    local jsonFile = io.open(jsonFileName, "w")
    local index = 0
    local conts = {}
    local types = {}
    local names = {}
    local bstringkey = false
    
    local has_data_1 = false
    for csvFileLine in csvFile:lines() do
        index = index + 1
        if index > 0 then
            if index == 1 then
                conts = splitString(csvFileLine, ",")
                if conts[1] == "IDSTRING" or conts[1] == "IDJSONSTRING" then
                    bstringkey = true
                    jsonFile:write("{" .. lineBreak())
                else
                    bstringkey = false
                    jsonFile:write("[" .. lineBreak())
                end
            elseif index == 2 then
                types = splitString(csvFileLine, ",")
            elseif index == 3 then
                names = splitString(csvFileLine, ",")
            else
                local elementData = splitString(csvFileLine, ",")
                if has_data_1 then
                    jsonFile:write("," .. lineBreak())
                end
                if bstringkey then
                    jsonFile:write(tab(1) .. "\"" .. elementData[1] .. "\" : {" .. lineBreak())
                else
                    jsonFile:write(tab(1) .. "{" .. lineBreak())
                end
                local has_data_2 = false
                for k, v in pairs(elementData) do 
                    if has_data_2 then
                        jsonFile:write("," .. lineBreak()) 
                    end  
                    if types[k] == "index" then
                        if v == "\"\"" then
                            print("key wrong")
                            break
                        end
                        if bstringkey then
                            jsonFile:write(tab(2) .. "\"" .. names[k] .. "\"" .. " : " .. "\"" .. v .. "\"")
                        else
                            jsonFile:write(tab(2) .. "\"" .. names[k] .. "\"" .. " : " .. v)
                        end
                    elseif types[k] == "int" then
                        if v == "" then
                            v = 0
                        end
                        jsonFile:write(tab(2) .. "\"" .. names[k] .. "\"" .. " : " .. v)
                    elseif types[k] == "float" then
                        if v == "" then
                            v = 0.0
                        end
                        jsonFile:write(tab(2) .. "\"" .. names[k] .. "\"" .. " : " .. v)
                    elseif types[k] == "string" then
                        if v == "\"\"" then
                            jsonFile:write(tab(2) .. "\"" .. names[k] .. "\"" .. " : " ..  v)
                        else
                            jsonFile:write(tab(2) .. "\"" .. names[k] .. "\"" .. " : \"" ..  v .. "\"")
                        end
                    elseif types[k] == "list" then
                        jsonFile:write(tab(2) .. "\"" .. names[k] .. "\" : [")
                        local v1 = string.gsub(v, "|", ",")
                        jsonFile:write(v1)
                        jsonFile:write("]")
                    elseif types[k] == "table" then
                        jsonFile:write(tab(2) .. "\"" .. names[k] .. "\" : [")
                        v = string.gsub(v, "*", ",")
                        v = string.gsub(v, "{", "[")
                        v = string.gsub(v, "}", "]")
                        jsonFile:write(v)
                        jsonFile:write("]")
                    elseif types[k] == "table_string" then
                        jsonFile:write(tab(2) .. "\"" .. names[k] .. "\" : [")
                        v = string.gsub(v, "*", "\",\"")
                        v = string.gsub(v, "{", "[")
                        v = string.gsub(v, "}", "]")
                        jsonFile:write("\"" .. v .. "\"")
                        jsonFile:write("]")
                    else
                        print("type wrong")    
                    end
                    has_data_2 = true
                end
                jsonFile:write(lineBreak() .. tab(1) .. "}")
                has_data_1 = true
            end
        end
    end
    if bstringkey then
        jsonFile:write(lineBreak() .. "}")
    else
        jsonFile:write(lineBreak() .. "]")
    end
    
    csvFile:close()
    jsonFile:close()
end

function GenJson()
    print("csv to json file---------------------------begin")
    local files = {}
    getpathes("csv\\", files)
    for _, fname in pairs(files or {}) do
        local tb = splitString(fname, ".")
        assert(#tb > 0)
        local name = tb[1]
        print(name)
        csvToJson(name)
    end
    print("csv to json file---------------------------end")
end

GenJson()
