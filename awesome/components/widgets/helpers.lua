-------------------------------------------------------------------------------
--   __        ___     _            _     _   _      _                       --
--   \ \      / (_) __| | __ _  ___| |_  | | | | ___| |_ __   ___ _ __       --
--    \ \ /\ / /| |/ _` |/ _` |/ _ \ __| | |_| |/ _ \ | '_ \ / _ \ '__|      --
--     \ V  V / | | (_| | (_| |  __/ |_  |  _  |  __/ | |_) |  __/ |         --
--      \_/\_/  |_|\__,_|\__, |\___|\__| |_| |_|\___|_| .__/ \___|_|         --
--                       |___/                        |_|                    --
--    _____                 _   _                                            --
--   |  ___|   _ _ __   ___| |_(_) ___  _ __  ___                            --
--   | |_ | | | | '_ \ / __| __| |/ _ \| '_ \/ __|                           --
--   |  _|| |_| | | | | (__| |_| | (_) | | | \__ \                           --
--   |_|   \__,_|_| |_|\___|\__|_|\___/|_| |_|___/                           --
-------------------------------------------------------------------------------                                        

local helpers = {}

local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local naughty = require("naughty")

local colorscheme = require("components.colorscheme")

local theme_shape = function(cr, width, height) gears.shape.rounded_rect(cr, width, height, 10) end -- gears.shape.rounded_bar


-- Add a margin container around a widget - especially used to embed into
-- a background container
helpers.widget_add_margin = function(widget, user_args)
    local args = user_args or {}

    return wibox.widget({
        widget or wibox.widget(),
        left   = args.left or 16,
        right  = args.right or 16,
        top    = args.top or 2,
        bottom = args.bottom or 2,
        widget = wibox.container.margin
    })
end

-- Creates a textbox widget with increased font size and margin at the bottom:
helpers.wrap_symbol = function(symbol, symbol_size)
	widget_box = wibox.widget({
        text = symbol,
        font = "sans " .. (symbol_size or "18"),
        widget = wibox.widget.textbox
    })

    return wibox.widget({
        widget_box,
        bottom = 3,
        widget = wibox.container.margin
    })
end

helpers.create_symbol_widget = function(symbol, widget, foreground, symbol_size)
    local widget_symbol = helpers.wrap_symbol(symbol, symbol_size)

    local widget_combination = wibox.widget({
        widget_symbol,
        nil,
        widget,
		layout = wibox.layout.align.horizontal
    })
    
    return wibox.widget({
		widget_combination,
		fg = foreground,
		widget = wibox.container.background
	})

end

-- This function creates a widget that consists of a symbol and text.
helpers.symbol_textbox = function (symbol, text, foreground)
    return helpers.create_symbol_widget(symbol, wibox.widget.textbox(text), foreground)
end

helpers.textbox_colorized = function(text, foreground)
    return wibox.widget({
		wibox.widget.textbox(text),
		fg = foreground,
		widget = wibox.container.background
	})
end


-------------------------------------------------------------------------------
--   __        __                                                            --
--   \ \      / / __ __ _ _ __  _ __   ___ _ __                              --
--    \ \ /\ / / '__/ _` | '_ \| '_ \ / _ \ '__|                             --
--     \ V  V /| | | (_| | |_) | |_) |  __/ |                                --
--      \_/\_/ |_|  \__,_| .__/| .__/ \___|_|                                --
--                       |_|   |_|                                           --
-------------------------------------------------------------------------------

-- Wrap widget and add coloured and rounded background:
helpers.wrapper_background = function(widget)
    return wibox.widget({
		widget,

		bg = colorscheme.black,
		shape = theme_shape,
		widget = wibox.container.background
    })
end


helpers.containerize_widget = function(widget)
    return helpers.wrapper_background(helpers.widget_add_margin(widget))
end

-- Wrap widget to add an outer margin in order to embed it into
-- the wibox with space between this and the next widget. This is the
-- final step to place a widget into the wibox.
helpers.embed_widget = function(widget)
    return wibox.widget({
        widget,
        left = 5,
        right = 5,
        widget = wibox.container.margin
    })
end

helpers.factorize_widget = function(widget)
    return helpers.embed_widget(helpers.containerize_widget(widget))
end

return helpers