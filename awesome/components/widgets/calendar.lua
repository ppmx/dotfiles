local wibox = require("wibox")
local helpers = require("components.widgets.helpers")
local colorscheme = require("components.colorscheme")

local textcalendar = wibox.widget({
    format="%a %b %d",
    widget = wibox.widget.textclock
})

local widget = helpers.create_symbol_widget(" ", textcalendar, colorscheme.yellow)
return helpers.factorize_widget(widget)
