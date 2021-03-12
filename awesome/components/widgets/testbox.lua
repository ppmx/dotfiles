
local testing = {}

local helpers = require("components.widgets.helpers")

local colorscheme = require("components.colorscheme")
local wibox = require("wibox")

testing.testbox = function(add, user_args)
    local args = user_args or {}

    local text = args.text or "hello world"
    return wibox.widget.textbox(add .. text)
end


return testing
