-- Widget "Network Status Bar"

local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local helpers = require("components.widgets.helpers")
local colorscheme = require("components.colorscheme")

local io = require("io")
local os = require("os")

local network_status = wibox.widget.textbox("fetching...")
local network_widget = helpers.create_symbol_widget("殺 ", network_status, colorscheme.yellow)

local update_network_status = function(widget)
    local command = "/usr/bin/ping -c 1 -W 4 8.8.8.8"
    --local command = "/tmp/foobar.py"

    local handler = function (stdout, stderr, exitreason, exitcode)
        if exitcode == 0 then
            network_widget.fg = colorscheme.green
            network_status.text = "uplink"
        else
            network_widget.fg = colorscheme.red
            network_status.text = "offline"
        end
    end

    awful.spawn.easy_async(command, handler)
end

timer = gears.timer({timeout = 5})

timer:connect_signal("timeout", function()
    update_network_status()
end)

timer:start()

return helpers.factorize_widget(network_widget)
