local helpers = require("components.widgets.helpers")

local wibox = require("wibox")

local colorscheme = require("components.colorscheme")

local volumearc_widget = require("awesome-wm-widgets.volumearc-widget.volumearc")
local batteryarc_widget = require("awesome-wm-widgets.batteryarc-widget.batteryarc")
local brightnessarc_widget = require("awesome-wm-widgets.brightnessarc-widget.brightnessarc")

local battery_widget = batteryarc_widget({
    show_notification_mode = 'on_click',

    low_level_color    = colorscheme.red,
    medium_level_color = colorscheme.yellow,
    charging_color     = colorscheme.green
})

local system_widget = helpers.wrap_widget(
    wibox.widget({
        helpers.widget_add_margin(brightnessarc_widget(), {
            right = 4,
            top = 2,
            bottom = 2
        }),

        helpers.widget_add_margin(volumearc_widget(), {
            left = 4,
            right = 4,

            top = 2, bottom = 2
        }),

        helpers.widget_add_margin(battery_widget, {
            left = 4,
        
            top = 2, bottom = 2
        }),

        layout = wibox.layout.align.horizontal
    }),


    colorscheme.white,
    colorscheme.black
)


return system_widget
