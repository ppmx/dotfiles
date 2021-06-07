-- Widget: "Logo"

local helpers = require("components.widgets.helpers")

local symbols = {
    helpers.wrap_symbol(""),
    helpers.wrap_symbol("廬"),
    helpers.wrap_symbol("ﮧ"),
    helpers.wrap_symbol(""),
    helpers.wrap_symbol("﫸"),
    helpers.wrap_symbol("")
}

local current_symbol = 5
local logo = helpers.factorize_widget(symbols[current_symbol])

logo:connect_signal('button::press',
    function(_, _, _, button)
        if (button ~= 1 and button ~= 3) then return end

        if (button == 1) then
            current_symbol = (current_symbol + 1) % #symbols
        elseif (button == 3) then
            current_symbol = (current_symbol - 1) % #symbols
        end

        logo.widget = helpers.containerize_widget(symbols[current_symbol + 1])
    end
)

return logo