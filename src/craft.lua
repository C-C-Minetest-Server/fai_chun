-- fai_chun/src/craft.lua
-- Crafting recipes
-- Copyright (c) 2026  1F616EMO
-- SPDX-License-Identifier: LGPL-3.0-or-later

local xcompat_exists = core.global_exists("xcompat")
local paper = xcompat_exists and xcompat.materials.paper or nil
local dye_red = xcompat_exists and xcompat.materials.dye_red or nil
local gold_ingot = xcompat_exists and xcompat.materials.gold_ingot or nil

-- Craft from paper and red dye
if paper and dye_red then
    core.register_craft({
        output = "fai_chun:doufang_upright 2",
        recipe = {
            { "",    paper,   "" },
            { paper, dye_red, paper },
            { "",    paper,   "" },
        },
    })

    core.register_craft({
        output = "fai_chun:chuntiao_vertical 2",
        recipe = {
            { paper, "",      "" },
            { paper, dye_red, "" },
            { paper, "",      "" },
        },
    })

    core.register_craft({
        output = "fai_chun:chuntiao_horizontal 2",
        recipe = {
            { "",    dye_red, "" },
            { paper, paper,   paper },
        },
    })
end

-- Special fai chun
if gold_ingot then
    core.register_craft({
        type = "shapeless",
        output = "fai_chun:doufang_text_fu_upright",
        recipe = { "fai_chun:doufang_upright", gold_ingot },
    })

    core.register_craft({
        type = "shapeless",
        output = "fai_chun:doufang_text_fu_inverted",
        recipe = { "fai_chun:doufang_inverted", gold_ingot },
    })
end

-- Cycling/combination crafts

core.register_craft({
    type = "shapeless",
    output = "fai_chun:doufang_upright",
    recipe = { "fai_chun:doufang_inverted" },
})

core.register_craft({
    type = "shapeless",
    output = "fai_chun:doufang_inverted",
    recipe = { "fai_chun:doufang_upright" },
})

core.register_craft({
    type = "shapeless",
    output = "fai_chun:chuntiao_vertical",
    recipe = { "fai_chun:chuntiao_horizontal" },
})

core.register_craft({
    type = "shapeless",
    output = "fai_chun:chuntiao_horizontal",
    recipe = { "fai_chun:chuntiao_vertical" },
})

core.register_craft({
    output = "fai_chun:chunlian",
    recipe = {
        { "fai_chun:chuntiao_vertical" },
        { "fai_chun:chuntiao_vertical" },
    }
})

-- Special fai chun cycling

core.register_craft({
    type = "shapeless",
    output = "fai_chun:doufang_text_fu_upright",
    recipe = { "fai_chun:doufang_text_fu_inverted" },
})

core.register_craft({
    type = "shapeless",
    output = "fai_chun:doufang_text_fu_inverted",
    recipe = { "fai_chun:doufang_text_fu_upright" },
})
