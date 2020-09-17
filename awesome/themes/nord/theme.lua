-- Awesome WM Nord Theme
--

local theme_assets = require("beautiful.theme_assets")
local gears = require("gears")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local theme = {}

theme.dir = os.getenv("HOME") .. "/.config/awesome/themes/nord/"
theme.icons = theme.dir .. "/icons"

-- https://nordtheme.com
colors = {
    night = {
        polar1 = "#2E3440",
        polar2 = "#3B4252",
        polar3 = "#434C5E",
        polar4 = "#4C566A"
    },

    snow = {
        snow1 = "#D8DEE9",
        snow2 = "#E5E9F0",
        snow3 = "#ECEFF4"
    },

    frost = {
        frost1 = "#8FBCBB",
        frost2 = "#88C0D0",
        frost3 = "#81A1C1",
        frost4 = "#5E81AC"
    },

    aurora = {
        red    = "#BF616A",
        orange = "#D08770",
        yellow = "#EBCB8B",
        green  = "#A3BE8C",
        lila   = "#B48EAD"
    }
}

-- Setup default colors:
theme.color_default_fg       = colors.frost.snow1
theme.color_default_focus    = colors.aurora.green
theme.color_default_bg_focus = colors.night.polar2
theme.color_default_urgent   = colors.aurora.red
theme.color_default_bg       = colors.night.polar1

-- Setup wallpaper function:
theme.wallpaper_img = theme.dir .. "/wallpaper.png"
theme.wallpaper = function (s) gears.wallpaper.maximized(theme.wallpaper_img, s, "#fff") end

theme.panel = "png:" .. theme.icons .. "/panel/panel.png"
theme.font  = "sans " .. dpi(10)

theme.fg_normal  = theme.color_default_fg
theme.fg_focus   = colors.aurora.green
theme.fg_urgent  = colors.aurora.red

theme.bg_normal  = theme.color_default_bg
theme.bg_focus   = colors.night.polar2
theme.bg_urgent  = colors.aurora.orange


-- Borders and Gaps:
theme.border_width = dpi(1)
theme.border_normal = colors.frost.frost3
theme.border_focus = colors.aurora.green
theme.border_marked = colors.aurora.green
theme.useless_gap = dpi(4)


-- Menu:
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)


-- Notifications:
theme.notification_margin = dpi(30)


-- Layout:
theme.layout_floating   = theme.icons .. "/panel/layouts/floating.png"
theme.layout_tile       = theme.icons .. "/panel/layouts/tile.png"
theme.layout_tileleft   = theme.icons .. "/panel/layouts/tileleft.png"
theme.layout_tilebottom = theme.icons .. "/panel/layouts/tilebottom.png"
theme.layout_tiletop    = theme.icons .. "/panel/layouts/tiletop.png"



-- Taglist
theme.taglist_fg_focus  = theme.color_default_focus
theme.taglist_bg_focus  = colors.night.polar4
theme.taglist_bg_normal = theme.color_default_bg

local taglist_square_size = dpi(4)

theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size,
    colors.snow.snow3
)

theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size,
    colors.snow.snow3
)


-- Tasklist
theme.tasklist_disable_icon         = true
theme.tasklist_bg_focus             = theme.color_default_bg
theme.tasklist_fg_focus             = theme.color_default_fg


-- Titlebar
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

return theme

