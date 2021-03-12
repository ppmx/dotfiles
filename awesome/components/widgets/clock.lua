
local helpers = require("components.widgets.helpers")
local colorscheme = require("components.colorscheme")
local wibox = require("wibox")


local textclock = wibox.widget({
    format="%H:%M",
    widget = wibox.widget.textclock
})

local widget = helpers.create_symbol_widget(" ", textclock, colorscheme.green)
return helpers.factorize_widget(widget)


