-- fai_chun/src/helper.lua
-- Helper functions
-- Copyright (c) 2026  1F616EMO
-- SPDX-License-Identifier: LGPL-3.0-or-later

if core.global_exists("modlib") then
    local utf8_char = modlib.utf8.char
    local utf8_codes = modlib.utf8.codes

    local cjk_chars = {
        [0x2014] = true, -- EM DASH (two combined -> Chinese dash)
        [0x201C] = true, -- LEFT DOUBLE QUOTATION MARK (used in SC)
        [0x201D] = true, -- RIGHT DOUBLE QUOTATION MARK (used in SC)
        [0xFF0C] = true, -- FULLWIDTH COMMA
        [0xFF0F] = true, -- FULLWIDTH SOLIDUS
        [0xFF1A] = true, -- FULLWIDTH COLON
        [0xFF1B] = true, -- FULLWIDTH SEMICOLON
    }
    local cjk_ranges = {
        { 0x3000,  0x303F },  -- CJK Symbols and Punctuation
        { 0x4E00,  0x9FFF },  -- CJK Unified Ideographs
        { 0x3400,  0x4DBF },  -- CJK Unified Ideographs Extension A
        { 0x20000, 0x2A6DF }, -- CJK Unified Ideographs Extension B
        { 0x2A700, 0x2B73F }, -- CJK Unified Ideographs Extension C
        { 0x2B740, 0x2B81F }, -- CJK Unified Ideographs Extension D
        { 0x2B820, 0x2CEAF }, -- CJK Unified Ideographs Extension E
        { 0x2CEB0, 0x2EBEF }, -- CJK Unified Ideographs Extension F
        { 0x30000, 0x3134F }, -- CJK Unified Ideographs Extension G
        { 0x31350, 0x323AF }, -- CJK Unified Ideographs Extension H
        { 0x2EBF0, 0x2EE5F }, -- CJK Unified Ideographs Extension I
        { 0x323B0, 0x3347F }, -- CJK Unified Ideographs Extension J
        { 0xF900,  0xFAFF },  -- CJK Compatibility Ideographs
        { 0x2F800, 0x2FA1F }, -- CJK Compatibility Ideographs Supplement
    }
    local function is_char_cjk(codepoint)
        if cjk_chars[codepoint] then
            return true
        end
        for _, ranges in ipairs(cjk_ranges) do
            if codepoint >= ranges[1] and codepoint <= ranges[2] then
                return true
            end
        end
        return false
    end

    local function is_all_cjk(str)
        for _, codepoint in utf8_codes(str) do
            if not is_char_cjk(codepoint) then
                return false
            end
        end
        return true
    end

    local old_update_sign = signs_lib.update_sign
    signs_lib.update_sign = function(pos, fields) -- luacheck: ignore
        if fields and fields.text and type(fields.text) == "string" then
            local orig_text = fields.text
            local node = core.get_node(pos)

            if node.name == "fai_chun:chuntiao_vertical" or node.name == "fai_chun:chunlian" then
                if is_all_cjk(orig_text) then
                    local chars = {}
                    for _, codepoint in utf8_codes(orig_text) do
                        chars[#chars+1] = utf8_char(codepoint)
                        chars[#chars+1] = "\n"
                    end
                    fields.text = table.concat(chars)
                end
            end
        end

        return old_update_sign(pos, fields)
    end
end
