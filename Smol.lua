--- STEAMODDED HEADER
--- MOD_NAME: smols Cards
--- MOD_ID: Smols
--- PREFIX: smol
--- MOD_AUTHOR: [Smol Lusty joker]
--- MOD_DESCRIPTION: Adds silly little doodles to your playing cards
--- LOADER_VERSION_GEQ: 1.2
--- VERSION: 1.2
--- BADGE_COLOR: FF6368

local atlas_key = 'smol_atlas' -- Format: PREFIX_atlas
-- See end of file for notes
local atlas_path = 'smol_lc.png' -- Filename for the image in the asset folder
local atlas_path_hc = 'smol_hc.png' -- Filename for the high-contrast version of the texture, if existing

local suits = {'hearts', 'clubs', 'diamonds', 'spades'} -- Which suits to replace
local ranks = {'Jack', 'Queen', "King", "Ace", "10", "9", "8", "7", "6", "5", "4", "3", "2"} -- Which ranks to replace

local description = {
    hearts = "Lusty Joker",
    clubs = "WIP",
    diamonds = "WIP",
    spades = "People of thesus",
}
-----------------------------------------------------------
-- You should only need to change things above this line --
-----------------------------------------------------------

SMODS.Atlas{  
    key = atlas_key..'_lc',
    px = 71,
    py = 95,
    path = atlas_path,
    prefix_config = {key = false},
}

if atlas_path_hc then
    SMODS.Atlas{  
        key = atlas_key..'_hc',
        px = 71,
        py = 95,
        path = atlas_path_hc,
        prefix_config = {key = false},
    }
end

for _, suit in ipairs(suits) do
    SMODS.DeckSkin{
        key = suit.."_skin",
        suit = suit:gsub("^%l", string.upper),
        ranks = ranks,
		display_ranks = {"Ace", "King", "Queen", "Jack"}, -- These are the ranks preveiwed For
        lc_atlas = atlas_key..'_lc',
        hc_atlas = (atlas_path_hc and atlas_key..'_hc') or atlas_key..'_lc',
        loc_txt = {
            ['en-us'] = description[suit]},
        posStyle = 'deck'
    }
end
