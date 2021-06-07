-- Widget: Clock

local colorscheme = require("components.colorscheme")
local helpers = require("components.widgets.helpers")
local wibox = require("wibox")

local textclock = wibox.widget({
    format="%H:%M",
    widget = wibox.widget.textclock
})

local widget = helpers.create_symbol_widget(" ", textclock, colorscheme.blue)
return helpers.factorize_widget(widget)