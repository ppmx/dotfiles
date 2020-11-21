--------------------------------------------------------------------------------------------------
--                                                                                              --
--     __ ___      _____  ___  ___  _ __ ___   ___   __      ___ __ ___                         --
--    / _` \ \ /\ / / _ \/ __|/ _ \| '_ ` _ \ / _ \  \ \ /\ / / '_ ` _ \                        --
--   | (_| |\ V  V /  __/\__ \ (_) | | | | | |  __/   \ V  V /| | | | | |                       --
--    \__,_| \_/\_/ \___||___/\___/|_| |_| |_|\___|    \_/\_/ |_| |_| |_|                       --
--                                                                                              --
--    _   _                                                                                     --
--   | |_| |__   ___ _ __ ___   ___       __ _ _   _ _ __ ___  _ __ __ _                        --
--   | __| '_ \ / _ \ '_ ` _ \ / _ \     / _` | | | | '__/ _ \| '__/ _` |                       --
--   | |_| | | |  __/ | | | | |  __/    | (_| | |_| | | | (_) | | | (_| |                       --
--    \__|_| |_|\___|_| |_| |_|\___|     \__,_|\__,_|_|  \___/|_|  \__,_|                       --
--                                                                                              --
--------------------------------------------------------------------------------------------------


local theme = {}


local theme_assets = require("beautiful.theme_assets")
local gears        = require("gears")
local xresources   = require("beautiful.xresources")
local dpi          = xresources.apply_dpi

theme.dir   = os.getenv("HOME") .. "/.config/awesome/themes/naroka"
theme.icons = theme.dir .. "/icons"



--------------------------------------------------------------------------------------------------
--            _                     _                         
--   ___ ___ | | ___  _ __ ___  ___| |__   ___ _ __ ___   ___ 
--  / __/ _ \| |/ _ \| '__/ __|/ __| '_ \ / _ \ '_ ` _ \ / _ \
-- | (_| (_) | | (_) | |  \__ \ (__| | | |  __/ | | | | |  __/
--  \___\___/|_|\___/|_|  |___/\___|_| |_|\___|_| |_| |_|\___|
--

colors = {
	-- special
	foreground    = "#c5c8c6",
	background    = "#1b1b1b",
	cursorColor   = "#c5c8c6",

	-- black
	color0        = "#1d1f21",
	color8        = "#969896",

	-- red
	color1        = "#da6767",
	color9        = "#eb9e9e",

	-- green
	color2        = "#c9d368",
	color10       = "#c9d085",

	-- yellow
	color3        = "#fac45d",
	color11       = "#e8ce9c",

	-- blue
	color4        = "#79a3c7",
	color12       = "#a0bcd3",

	-- magenta
	color5        = "#b98fc6",
	color13       = "#cab4d0",

	-- cyan
	color6        = "#87bdb5",
	color14       = "#aed0cb",

	-- white
	color7        = "#caccca",
	color15       = "#ffffff"
}



--------------------------------------------------------------------------------------------------
--            _                         _   _   _
--   ___ ___ | | ___  _ __     ___  ___| |_| |_(_)_ __   __ _ ___
--  / __/ _ \| |/ _ \| '__|   / __|/ _ \ __| __| | '_ \ / _` / __|
-- | (_| (_) | | (_) | |      \__ \  __/ |_| |_| | | | | (_| \__ \
--  \___\___/|_|\___/|_|      |___/\___|\__|\__|_|_| |_|\__, |___/
--                                                      |___/
--
--
-- The following settings can be passed:
-- 
-- theme.fg_{normal,focus,urgent}
-- theme.bg_{normal,focus,urgent}
--
-- theme.taglist_{fg,bg}_{normal,focus,urgent}
-- theme.tasklist_{fg,bg}_{normal,focus,urgent}
-- theme.titlebar_{fg,bg}_{normal,focus,urgent}
--

theme.fg_normal  = colors.foreground
theme.bg_normal  = colors.background

theme.fg_focus   = colors.color3 -- green
theme.bg_focus   = colors.background

theme.fg_urgent  = colors.color1 -- red
theme.bg_urgent  = colors.background

-- Taglist:
theme.taglist_fg_focus   = colors.background
theme.taglist_bg_focus   = colors.color7

theme.taglist_bg_urgent = theme.fg_urgent
theme.taglist_fg_urgent = theme.bg_urgent

-- Tasklist
theme.tasklist_bg_normal = theme.bg_normal
theme.tasklist_bg_focus  = theme.bg_normal
theme.tasklist_bg_urgent = theme.bg_normal

-- Titlebar:
theme.titlebar_fg_focus = colors.color2 -- green
theme.titlebar_bg_focus = colors.background

theme.titlebar_fg_normal = colors.color15 -- some white shade
theme.titlebar_bg_normal = colors.background



-------------------------------------------------------------------------------------------------
--                _ _                             
-- __      ____ _| | |_ __   __ _ _ __   ___ _ __ 
-- \ \ /\ / / _` | | | '_ \ / _` | '_ \ / _ \ '__|
--  \ V  V / (_| | | | |_) | (_| | |_) |  __/ |   
--   \_/\_/ \__,_|_|_| .__/ \__,_| .__/ \___|_|   
--                   |_|         |_|
--

theme.wallpaper_img = theme.dir .. "/wallpaper.png"
theme.wallpaper = function (s) gears.wallpaper.maximized(theme.wallpaper_img, s, "#fff") end
--theme.wallpaper = function (s) gears.wallpaper.tiled(theme.wallpaper_img, s) end

theme.panel           = "png:" .. theme.icons .. "/panel/panel.png"
theme.font            = "sans " .. dpi(7)


-- wats bg sysrray
theme.bg_systray = "#d6d6d6"
theme.bat_bg_critical   = "#ff0000"

theme.clockgf    = "#000000"



-------------------------------------------------------------------------------------------------
--  _                   _           
-- | |__   ___  _ __ __| | ___ _ __ 
-- | '_ \ / _ \| '__/ _` |/ _ \ '__|
-- | |_) | (_) | | | (_| |  __/ |   
-- |_.__/ \___/|_|  \__,_|\___|_|   
--

theme.border_width = dpi(2)
theme.border_normal = "#3F3F3F"
theme.border_focus = "#6F6F6F"
theme.border_marked = "#CC9393"
theme.useless_gap = dpi(4)


-- Menu:
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)


-- Notifications:
theme.notification_margin = dpi(30)



--------------------------------------------------------------------------------------------------
--  _              _ _     _   
-- | |_ __ _  __ _| (_)___| |_ 
-- | __/ _` |/ _` | | / __| __|
-- | || (_| | (_| | | \__ \ |_ 
--  \__\__,_|\__, |_|_|___/\__|
--           |___/    
--

local taglist_square_size = dpi(4)

theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size,
    colors.foreground
)

theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size,
    colors.foreground

)



--------------------------------------------------------------------------------------------------
--  _            _    _ _     _
-- | |_ __ _ ___| | _| (_)___| |_
-- | __/ _` / __| |/ / | / __| __|
-- | || (_| \__ \   <| | \__ \ |_
--  \__\__,_|___/_|\_\_|_|___/\__|
--

--theme.tasklist_font                 = "Terminus 8"
theme.tasklist_disable_icon         = true


-- | Widget | --

theme.widget_display   = theme.icons .. "/panel/widgets/display/widget_display.png"
theme.widget_display_r = theme.icons .. "/panel/widgets/display/widget_display_r.png"
theme.widget_display_c = theme.icons .. "/panel/widgets/display/widget_display_c.png"
theme.widget_display_l = theme.icons .. "/panel/widgets/display/widget_display_l.png"


-- | Separators | --

theme.spr    = theme.icons .. "/panel/separators/spr.png"
theme.sprtr  = theme.icons .. "/panel/separators/sprtr.png"
theme.spr4px = theme.icons .. "/panel/separators/spr4px.png"
theme.spr5px = theme.icons .. "/panel/separators/spr5px.png"

-- | Misc | --

theme.menu_submenu_icon = theme.icons .. "/submenu.png"
theme.chrome         = theme.dir .. "/icons/apps/chrome.png"



--------------------------------------------------------------------------------------------------
--  _   _ _   _      _                    _           _   _
-- | |_(_) |_| | ___| |__   __ _ _ __    | |__  _   _| |_| |_ ___  _ __  ___
-- | __| | __| |/ _ \ '_ \ / _` | '__|   | '_ \| | | | __| __/ _ \| '_ \/ __|
-- | |_| | |_| |  __/ |_) | (_| | |      | |_) | |_| | |_| || (_) | | | \__ \
--  \__|_|\__|_|\___|_.__/ \__,_|_|      |_.__/ \__,_|\__|\__\___/|_| |_|___/
--

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



--------------------------------------------------------------------------------------------------
--  _                         _       _                     
-- | | __ _ _   _  ___  _   _| |_    (_) ___ ___  _ __  ___ 
-- | |/ _` | | | |/ _ \| | | | __|   | |/ __/ _ \| '_ \/ __|
-- | | (_| | |_| | (_) | |_| | |_    | | (_| (_) | | | \__ \
-- |_|\__,_|\__, |\___/ \__,_|\__|   |_|\___\___/|_| |_|___/
--          |___/
--

theme.layout_floating   = theme.icons .. "/panel/layouts/floating.png"
theme.layout_tile       = theme.icons .. "/panel/layouts/tile.png"
theme.layout_tileleft   = theme.icons .. "/panel/layouts/tileleft.png"
theme.layout_tilebottom = theme.icons .. "/panel/layouts/tilebottom.png"
theme.layout_tiletop    = theme.icons .. "/panel/layouts/tiletop.png"



--------------------------------------------------------------------------------------------------
--                 _          __                    __ _        __ _ _      
--   ___ _ __   __| |   ___  / _|   ___ ___  _ __  / _(_) __ _ / _(_) | ___ 
--  / _ \ '_ \ / _` |  / _ \| |_   / __/ _ \| '_ \| |_| |/ _` | |_| | |/ _ \
-- |  __/ | | | (_| | | (_) |  _| | (_| (_) | | | |  _| | (_| |  _| | |  __/
--  \___|_| |_|\__,_|  \___/|_|    \___\___/|_| |_|_| |_|\__, |_| |_|_|\___|
--                                                       |___/              
--------------------------------------------------------------------------------------------------
return theme
