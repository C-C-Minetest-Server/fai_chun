-- fai_chun/src/nodes.lua
-- Register nodes
-- Copyright (c) 2026  1F616EMO
-- SPDX-License-Identifier: LGPL-3.0-or-later

local S = core.get_translator("fai_chun")

local sound_signs = core.global_exists("xcompat") and xcompat.sounds.node_sound_leaves_defaults() or nil
local groups = {
    snappy = 3,
    axey = 1,
    swordy = 1,
    handy = 1,
}

local function register_sign(name, def)
    def.tiles = {
        "fai_chun_base.png",
    }
    signs_lib.register_sign(name, def)
    core.override_item(name, {
        tiles = { "fai_chun_base.png" },
    })
end

local function create_inventory_image(mask, mask_dimension)
    return "fai_chun_base.png^[resize:" .. mask_dimension .. "x" .. mask_dimension ..
        "^(" .. mask .. "^[makealpha:255,255,255)^[makealpha:0,0,0"
end

register_sign("fai_chun:doufang_upright", {
    description = S("Doufang (upright)"),

    drawtype = "mesh",
    mesh = "fai_chun_doufang_model.obj",
    inventory_image = create_inventory_image("fai_chun_doufang_mask.png", 1000),

    paramtype = "light",
    paramtype2 = "facedir",
    sunlight_propagates = true,

    selection_box = {
        type = "fixed",
        fixed = { -7 / 16, -7 / 16, 7 / 16, 7 / 16, 7 / 16, 0.5 },
    },
    walkable = false,

    groups = table.copy(groups),
    sounds = sound_signs,
    is_ground_content = false,

    default_color = "e",
    number_of_lines = 1,
    horiz_scaling = signs_lib.standard_hscale / 8,
    font_size = signs_lib.standard_fsize * 4,
    entity_info = {
        mesh = "fai_chun_signtext_doufang_upright.obj",
        yaw = signs_lib.standard_yaw
    },
})

register_sign("fai_chun:doufang_inverted", {
    description = S("Doufang (inverted)"),

    drawtype = "mesh",
    mesh = "fai_chun_doufang_model.obj",
    inventory_image =
        create_inventory_image("fai_chun_doufang_mask.png", 1000) ..
        "^(fai_chun_doufang_inverted_indicator.png^[makealpha:0,0,0^[resize:1000x1000)",

    paramtype = "light",
    paramtype2 = "facedir",
    sunlight_propagates = true,

    selection_box = {
        type = "fixed",
        fixed = { -7 / 16, -7 / 16, 7 / 16, 7 / 16, 7 / 16, 0.5 },
    },
    walkable = false,

    groups = table.copy(groups),
    sounds = sound_signs,
    is_ground_content = false,

    default_color = "e",
    number_of_lines = 1,
    horiz_scaling = signs_lib.standard_hscale / 8,
    font_size = signs_lib.standard_fsize * 4,
    entity_info = {
        mesh = "fai_chun_signtext_doufang_inverted.obj",
        yaw = signs_lib.standard_yaw
    },
})

register_sign("fai_chun:chuntiao_vertical", {
    description = S("Chuntiao (vertical)"),

    drawtype = "nodebox",
    inventory_image = create_inventory_image("fai_chun_chuntiao_mask.png", 32),

    paramtype = "light",
    paramtype2 = "facedir",
    sunlight_propagates = true,

    node_box = {
        type = "fixed",
        fixed = { -3 / 16, -7 / 16, 7 / 16, 3 / 16, 7 / 16, 0.5 },
    },
    selection_box = {
        type = "fixed",
        fixed = { -3 / 16, -7 / 16, 7 / 16, 3 / 16, 7 / 16, 0.5 },
    },
    walkable = false,

    groups = table.copy(groups),
    sounds = sound_signs,
    is_ground_content = false,

    default_color = "e",
    number_of_lines = 4,
    horiz_scaling = signs_lib.standard_hscale / 10,
    entity_info = {
        mesh = "fai_chun_signtext_chuntiao_vertical.obj",
        yaw = signs_lib.standard_yaw
    },
})

register_sign("fai_chun:chuntiao_horizontal", {
    description = S("Chuntiao (horizontal)"),

    drawtype = "nodebox",
    inventory_image = create_inventory_image("fai_chun_chuntiao_mask.png^[transformR90", 32),

    paramtype = "light",
    paramtype2 = "facedir",
    sunlight_propagates = true,

    node_box = {
        type = "fixed",
        fixed = { -7 / 16, -3 / 16, 7 / 16, 7 / 16, 3 / 16, 0.5 },
    },
    selection_box = {
        type = "fixed",
        fixed = { -7 / 16, -3 / 16, 7 / 16, 7 / 16, 3 / 16, 0.5 },
    },
    walkable = false,

    groups = table.copy(groups),
    sounds = sound_signs,
    is_ground_content = false,

    default_color = "e",
    number_of_lines = 1,
    horiz_scaling = signs_lib.standard_hscale / 4,
    entity_info = {
        mesh = "fai_chun_signtext_chuntiao_horizontal.obj",
        yaw = signs_lib.standard_yaw
    },
})

register_sign("fai_chun:chunlian", {
    description = S("Chunlian"),

    drawtype = "nodebox",
    inventory_image = create_inventory_image("fai_chun_chunlian_mask.png", 32),

    paramtype = "light",
    paramtype2 = "facedir",
    sunlight_propagates = true,

    node_box = {
        type = "fixed",
        fixed = { -3 / 16, -15 / 16, 7 / 16, 3 / 16, 15 / 16, 0.5 },
    },
    selection_box = {
        type = "fixed",
        fixed = { -3 / 16, -15 / 16, 7 / 16, 3 / 16, 15 / 16, 0.5 },
    },
    walkable = false,

    groups = table.copy(groups),
    sounds = sound_signs,
    is_ground_content = false,

    default_color = "e",
    number_of_lines = 12,
    horiz_scaling = signs_lib.standard_hscale / 10,
    entity_info = {
        mesh = "fai_chun_signtext_chunlian.obj",
        yaw = signs_lib.standard_yaw
    },
})
