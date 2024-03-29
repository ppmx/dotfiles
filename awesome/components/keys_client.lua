-------------------------------------------------------------------------------
--     ____ _ _            _      _  __                                      --
--    / ___| (_) ___ _ __ | |_   | |/ /___ _   _ ___                         --
--   | |   | | |/ _ \ '_ \| __|  | ' // _ \ | | / __|                        --
--   | |___| | |  __/ | | | |_   | . \  __/ |_| \__ \                        --
--    \____|_|_|\___|_| |_|\__|  |_|\_\___|\__, |___/                        --
--                                         |___/                             --
--                                                                           --
-- Keys to controle clients/windows                                          --
-------------------------------------------------------------------------------

local awful = require("awful")
local gears = require("gears")

client_keys = gears.table.join(
	awful.key(
		{ modkey }, "f",
		function (c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end,
		{description = "toggle fullscreen", group = "client"}
	),

	awful.key(
		{ modkey, "Shift" }, "c",
		function (c) c:kill() end,
		{description = "close", group = "client"}
	),

	awful.key(
		{ modkey, "Control" }, "space",
		awful.client.floating.toggle,
		{description = "toggle floating", group = "client"}
	),

	awful.key(
		{ modkey, "Control" }, "Return",
		function (c) c:swap(awful.client.getmaster()) end,
		{description = "move to master", group = "client"}
	),

	awful.key(
		{ modkey }, "o",
		function (c) c:move_to_screen() end,
		{description = "move to screen", group = "client"}
	),

	awful.key(
		{ modkey }, "t",
		function (c) c.ontop = not c.ontop end,
		{description = "toggle keep on top", group = "client"}),

	awful.key(
		{ modkey }, "m",
		function (c)
			c.maximized = not c.maximized
			c:raise()
		end,
		{description = "(un)maximize", group = "client"}
	),

	awful.key({ modkey, "Control" }, "m",
		function (c)
			c.maximized_vertical = not c.maximized_vertical
			c:raise()
		end ,
		{description = "(un)maximize vertically", group = "client"}),

	awful.key({ modkey, "Shift"   }, "m",
		function (c)
			c.maximized_horizontal = not c.maximized_horizontal
			c:raise()
		end ,
		{description = "(un)maximize horizontally", group = "client"})
)

return client_keys