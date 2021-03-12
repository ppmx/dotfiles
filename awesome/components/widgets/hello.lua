local helpers = require("components.widgets.helpers")

local colorscheme = require("components.colorscheme")
local wibox = require("wibox")

local banners = {
    helpers.symbol_textbox(" ", "inga", colorscheme.red),
    helpers.symbol_textbox(" ", "science", colorscheme.cyan),
    helpers.symbol_textbox(" ", "have fun!", colorscheme.green),
    helpers.symbol_textbox(" ", "all the networks", colorscheme.red),
    helpers.symbol_textbox(" ", "hack the planet", colorscheme.green),
}

local current_banner = 2
local widget_banner = helpers.factorize_widget(banners[current_banner])

widget_banner:connect_signal('button::press',
    function(_, _, _, button)
        if (button ~= 1 and button ~= 3) then return end

        if (button == 1) then
            current_banner = (current_banner + 1) % #banners
        elseif (button == 3) then
            current_banner = (current_banner - 1) % #banners
        end

        --current_banner = ((current_banner % #banners) + 1)
        widget_banner.widget = helpers.containerize_widget(banners[current_banner + 1])
    end
)

return widget_banner
