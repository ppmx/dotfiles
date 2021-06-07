-- Widget: Calendar

local colorscheme = require("components.colorscheme")
local helpers = require("components.widgets.helpers")
local wibox = require("wibox")

local textcalendar = wibox.widget({
    format="%a %b %d",
    widget = wibox.widget.textclock
})

local widget = helpers.create_symbol_widget(" ", textcalendar, colorscheme.blue)
return helpers.factorize_widget(widget)