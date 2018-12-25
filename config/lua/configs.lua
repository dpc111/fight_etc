local cfgs = {
   buff = require "config.buff",
   bullet = require "config.bullet",
   skill = require "config.skill",
   soldier = require "config.soldier",
   tower = require "config.tower",
}

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
