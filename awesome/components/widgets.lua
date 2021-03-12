local widgets = {}

local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local naughty = require("naughty")


local beautiful = require("beautiful")
beautiful.init("~/.config/awesome/themes/naroka/theme.lua")

local colorscheme = require("components.colorscheme")

local volumearc_widget = require("awesome-wm-widgets.volumearc-widget.volumearc")
local batteryarc_widget = require("awesome-wm-widgets.batteryarc-widget.batteryarc")
local brightnessarc_widget = require("awesome-wm-widgets.brightnessarc-widget.brightnessarc")


-- wrap widget into a rounded-bar container with margin left and right:
local function widget_colorize(widget, fg_color, bg_color)
	return wibox.widget({
		widget,
		fg = fg_color,
		bg = bg_color,
		shape = gears.shape.rounded_bar,
		widget = wibox.container.background
	})
end

local function widget_margin(widget)
    return wibox.widget({
        widget,
        left = 5,
        right = 5,
        widget = wibox.container.margin
    })
end


local function widget_margin_inner(widget, left, top, right, bottom)
    return wibox.widget({
        widget,
        left = left or 16,
        right = right or 16,
        top = top or 2,
        bottom = bottom or 4,
        widget = wibox.container.margin
    })
end

local function wrap_widget(widget, fg_color, bg_color)
    return widget_margin(widget_colorize(widget_margin_inner(widget), fg_color, bg_color))
end

local function symbol_textbox(symbol)
	return wibox.widget({
        text = symbol,
        font = "sans 20",
        widget = wibox.widget.textbox
    })
end


local function widget_factory(symbol, widget)
    return wibox.widget({
        symbol_textbox(symbol),
        nil,
        widget,
		layout = wibox.layout.align.horizontal
	})
end

widgets.textbox_colourized = function(text, foreground)
    return wibox.widget({
		wibox.widget.textbox(text),
		fg = foreground,
		widget = wibox.container.background
	})
end


-- the function embed_widget takes a widget and:
-- 1) embeds it into a colourized container so that we have a background
-- 2) Adds margin that it looks great
widgets.embed_widget = function(widget)
    -- add inner margin:

    local widget_wrapped = wibox.widget({
        widget,
        left = 20,
        right = 20,
        top = 2,
        bottom = 2,
        widget = wibox.container.margin
    })

    -- add background box as container:
    local widget_boxed = wibox.widget({
		widget_wrapped,
		--fg = fg_color,
		bg = colorscheme.black,
		shape = gears.shape.rounded_bar,
		widget = wibox.container.background
    })
    
    return wibox.widget({
        widget_boxed,
        left = 5,
        right = 5,
        widget = wibox.container.margin
    })
end


widgets.widget_wlan = wrap_widget(
    widget_factory(" ", wibox.widget.textbox("connected")),
    colorscheme.green,
    colorscheme.black
)


return widgets
