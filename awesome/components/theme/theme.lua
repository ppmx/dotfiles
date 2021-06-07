-------------------------------------------------------------------------------
--     __ ___      _____  ___  ___  _ __ ___   ___   __      ___ __ ___      --
--    / _` \ \ /\ / / _ \/ __|/ _ \| '_ ` _ \ / _ \  \ \ /\ / / '_ ` _ \     --
--   | (_| |\ V  V /  __/\__ \ (_) | | | | | |  __/   \ V  V /| | | | | |    --
--    \__,_| \_/\_/ \___||___/\___/|_| |_| |_|\___|    \_/\_/ |_| |_| |_|    --
--                                                                           --
--    _   _                                                                  --
--   | |_| |__   ___ _ __ ___   ___                                          --
--   | __| '_ \ / _ \ '_ ` _ \ / _ \                                         --
--   | |_| | | |  __/ | | | | |  __/                                         --
--    \__|_| |_|\___|_| |_| |_|\___|                                         --
-------------------------------------------------------------------------------

local theme = {}

local theme_assets = require("beautiful.theme_assets")
local gears        = require("gears")
local xresources   = require("beautiful.xresources")
local dpi          = xresources.apply_dpi
local colorscheme  = require("components.colorscheme")

theme.dir   = os.getenv("HOME") .. "/.config/awesome/components/theme"



-------------------------------------------------------------------------------
--   ____      _                   ___     _____           _                 --
--  / ___|___ | | ___  _ __ ___   ( _ )   |  ___|__  _ __ | |_ ___           --
-- | |   / _ \| |/ _ \| '__/ __|  / _ \/\ | |_ / _ \| '_ \| __/ __|          --
-- | |__| (_) | | (_) | |  \__ \ | (_>  < |  _| (_) | | | | |_\__ \          --
--  \____\___/|_|\___/|_|  |___/  \___/\/ |_|  \___/|_| |_|\__|___/          --
-------------------------------------------------------------------------------

theme.font_name = "FiraCode Nerd Font Mono" -- "sans"
theme.font  = theme.font_name .. " " .. dpi(10)
theme.taglist_font = "FiraCode Nerd Font Mono Bold 10"

theme.fg_normal  = colorscheme.white
theme.bg_normal  = colorscheme.bg

theme.fg_focus   = colorscheme.magenta
theme.bg_focus   = colorscheme.bg

theme.fg_urgent  = colorscheme.red
theme.bg_urgent  = colorscheme.bg



-------------------------------------------------------------------------------
--   ____      _                  _____           _ _     _                  --
--  / ___|___ | | ___  _ __ ___  |_   _|_ _  __ _| (_)___| |_                --
-- | |   / _ \| |/ _ \| '__/ __|   | |/ _` |/ _` | | / __| __|               --
-- | |__| (_) | | (_) | |  \__ \   | | (_| | (_| | | \__ \ |_                --
--  \____\___/|_|\___/|_|  |___/   |_|\__,_|\__, |_|_|___/\__|               --
--                                          |___/                            --
-------------------------------------------------------------------------------
theme.taglist_fg_focus   = colorscheme.bg
theme.taglist_bg_focus   = colorscheme.blue

theme.taglist_bg_urgent = theme.fg_urgent
theme.taglist_fg_urgent = theme.bg_urgent

theme.taglist_fg_occupied = colorscheme.blue
theme.taglist_bg_occupied = colorscheme.black

theme.taglist_spacing = dpi(2)

theme.taglist_fg_empty   = colorscheme.grey
theme.taglist_bg_empty   = colorscheme.black



-------------------------------------------------------------------------------
--   ____      _                  _____         _    _ _     _               --
--  / ___|___ | | ___  _ __ ___  |_   _|_ _ ___| | _| (_)___| |_             --
-- | |   / _ \| |/ _ \| '__/ __|   | |/ _` / __| |/ / | / __| __|            --
-- | |__| (_) | | (_) | |  \__ \   | | (_| \__ \   <| | \__ \ |_             --
--  \____\___/|_|\___/|_|  |___/   |_|\__,_|___/_|\_\_|_|___/\__|            --
-------------------------------------------------------------------------------

theme.tasklist_bg_normal = theme.bg_normal
theme.tasklist_bg_focus  = theme.bg_normal
theme.tasklist_bg_urgent = theme.bg_normal



-------------------------------------------------------------------------------
--   ____      _                  _____ _ _   _      _                       --
--  / ___|___ | | ___  _ __ ___  |_   _(_) |_| | ___| |__   __ _ _ __        --
-- | |   / _ \| |/ _ \| '__/ __|   | | | | __| |/ _ \ '_ \ / _` | '__|       --
-- | |__| (_) | | (_) | |  \__ \   | | | | |_| |  __/ |_) | (_| | |          --
--  \____\___/|_|\___/|_|  |___/   |_| |_|\__|_|\___|_.__/ \__,_|_|          --
-------------------------------------------------------------------------------

theme.titlebar_fg_focus = colorscheme.yellow
theme.titlebar_bg_focus = colorscheme.bg

theme.titlebar_fg_normal = colorscheme.white
theme.titlebar_bg_normal = colorscheme.bg



-------------------------------------------------------------------------------
--                _ _                                                        --
-- __      ____ _| | |_ __   __ _ _ __   ___ _ __                            --
-- \ \ /\ / / _` | | | '_ \ / _` | '_ \ / _ \ '__|                           --
--  \ V  V / (_| | | | |_) | (_| | |_) |  __/ |                              --
--   \_/\_/ \__,_|_|_| .__/ \__,_| .__/ \___|_|                              --
--                   |_|         |_|                                         --
-------------------------------------------------------------------------------

theme.wallpaper_img = theme.dir .. "/wallpaper.png"
--theme.wallpaper = function (s) gears.wallpaper.tiled(theme.wallpaper_img, s) end
theme.wallpaper = function (s) gears.wallpaper.maximized(theme.wallpaper_img, s) end



-------------------------------------------------------------------------------
--  _                   _                                                    --
-- | |__   ___  _ __ __| | ___ _ __                                          --
-- | '_ \ / _ \| '__/ _` |/ _ \ '__|                                         --
-- | |_) | (_) | | | (_| |  __/ |                                            --
-- |_.__/ \___/|_|  \__,_|\___|_|                                            --
-------------------------------------------------------------------------------

theme.border_width = dpi(2)
theme.border_normal = colorscheme.bg
theme.border_focus  = colorscheme.blue
theme.border_marked = colorscheme.red

theme.border_radius = dpi(8)
theme.border_shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, theme.border_radius)
end

theme.useless_gap = dpi(12)



-------------------------------------------------------------------------------
--  _   _       _   _  __ _           _   _                                  --
-- | \ | | ___ | |_(_)/ _(_) ___ __ _| |_(_) ___  _ __  ___                  --
-- |  \| |/ _ \| __| | |_| |/ __/ _` | __| |/ _ \| '_ \/ __|                 --
-- | |\  | (_) | |_| |  _| | (_| (_| | |_| | (_) | | | \__ \                 --
-- |_| \_|\___/ \__|_|_| |_|\___\__,_|\__|_|\___/|_| |_|___/                 --
-------------------------------------------------------------------------------

theme.notification_margin = dpi(30)



-------------------------------------------------------------------------------
--  _   _ _   _      _                  _           _   _                    --
-- | |_(_) |_| | ___| |__   __ _ _ __  | |__  _   _| |_| |_ ___  _ __  ___   --
-- | __| | __| |/ _ \ '_ \ / _` | '__| | '_ \| | | | __| __/ _ \| '_ \/ __|  --
-- | |_| | |_| |  __/ |_) | (_| | |    | |_) | |_| | |_| || (_) | | | \__ \  --
--  \__|_|\__|_|\___|_.__/ \__,_|_|    |_.__/ \__,_|\__|\__\___/|_| |_|___/  --
-------------------------------------------------------------------------------

theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"



-------------------------------------------------------------------------------
--  _                         _       _                                      --
-- | | __ _ _   _  ___  _   _| |_    (_) ___ ___  _ __  ___                  --
-- | |/ _` | | | |/ _ \| | | | __|   | |/ __/ _ \| '_ \/ __|                 --
-- | | (_| | |_| | (_) | |_| | |_    | | (_| (_) | | | \__ \                 --
-- |_|\__,_|\__, |\___/ \__,_|\__|   |_|\___\___/|_| |_|___/                 --
--          |___/                                                            --
-------------------------------------------------------------------------------

theme.layout_fairv      = theme.dir .. "/icons/panel/layouts/fairv.png"
theme.layout_floating   = theme.dir .. "/icons/panel/layouts/floating.png"
theme.layout_tile       = theme.dir .. "/icons/panel/layouts/tile.png"
theme.layout_tilebottom = theme.dir .. "/icons/panel/layouts/tilebottom.png"



-------------------------------------------------------------------------------
--                 _          __                    __ _        __ _ _       --
--   ___ _ __   __| |   ___  / _|   ___ ___  _ __  / _(_) __ _ / _(_) | ___  --
--  / _ \ '_ \ / _` |  / _ \| |_   / __/ _ \| '_ \| |_| |/ _` | |_| | |/ _ \ --
-- |  __/ | | | (_| | | (_) |  _| | (_| (_) | | | |  _| | (_| |  _| | |  __/ --
--  \___|_| |_|\__,_|  \___/|_|    \___\___/|_| |_|_| |_|\__, |_| |_|_|\___| --
--                                                       |___/               --
-------------------------------------------------------------------------------
return theme
