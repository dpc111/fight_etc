require "lfs"

function getpathes(rootpath, pathes)
    pathes = pathes or {}
    ret, files, iter = pcall(lfs.dir, rootpath)
    if ret == false then
        return pathes
    end
    for entry in files, iter do
        local next = false
        if entry ~= '.' and entry ~= '..' then
            local path = rootpath .. '/' .. entry
            local attr = lfs.attributes(path)
            if attr == nil then
                next = true
            end

            if next == false then 
                if attr.mode == 'directory' then
                    getpathes(path, pathes)
                else
                    table.insert(pathes, entry)
                end
            end
        end
        next = false
    end
    return pathes
end

function translate(value, filter)
    if filter == nil then
        return value
    end
    return filter(value)
end

function splitString(str, separator, filter)
	if str == nil then
		return nil
	end
	local ret = {}
	local spLen = string.len(separator)
	local pos = 1 - spLen
	while true do
		local pre = pos + spLen
		pos = string.find(str, separator, pre, true)
		if pos == nil then
		    local value = translate(string.sub(str, pre), filter)
		    if value ~= nil then
			    table.insert(ret, value)
			end
			break
		else
		    local value = translate(string.sub(str, pre, pos - 1), filter)
		    if value ~= nil then
			    table.insert(ret, value)
			end
		end
	end
	return ret
end

function tab(num)
    local str = ""
    for k = 0, num do
        str = str .. "   "
    end
    return str
end

function lineBreak()
    return "\n"
end

function align(str, max, c)
    str = str or ""
    c = c or " "
    local dtLen = string.len(str)
    local diff = max - dtLen
    if diff > 0 then
        for k = 1, diff do
            str = str .. c
        end
    end
    return str
end

function align_front(str, max, c)
    str = str or ""
    c = c or " "
    local dtLen = string.len(str)
    local diff = max - dtLen
    if diff > 0 then
        for k = 1, diff do
            str = c .. str
        end
    end
    return str
end

function change_str(str)
    return "\"" .. str .. "\""
end

function change_str_align(str, max)
    return change_str(align(str, max))
end