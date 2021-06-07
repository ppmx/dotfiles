-----------------------------------------------------------------------------------------------
--     __ ___      _____  ___  ___  _ __ ___   ___                                           --
--    / _` \ \ /\ / / _ \/ __|/ _ \| '_ ` _ \ / _ \                                          --
--   | (_| |\ V  V /  __/\__ \ (_) | | | | | |  __/                                          --
--    \__,_| \_/\_/ \___||___/\___/|_| |_| |_|\___|                                          --
--                     __ _                       _   _                                      --
--     ___ ___  _ __  / _(_) __ _ _   _ _ __ __ _| |_(_) ___  _ __                           --
--    / __/ _ \| '_ \| |_| |/ _` | | | | '__/ _` | __| |/ _ \| '_ \                          --
--   | (_| (_) | | | |  _| | (_| | |_| | | | (_| | |_| | (_) | | | |                         --
--    \___\___/|_| |_|_| |_|\__, |\__,_|_|  \__,_|\__|_|\___/|_| |_|                         --
--                          |___/                                                            --
-----------------------------------------------------------------------------------------------


-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local naughty = require("naughty")
local wibox = require("wibox")

-- When closing a window or switching the workspace, then this package
-- will automatically switch to the next window in the workspace.
require("awful.autofocus")

local widget_helper = require("components.widgets.helpers")
local workspaces = require("components.workspaces")

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi


-- Error handling: check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)

if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors
	})
end

-- Handle runtime errors after startup
do
	local in_error = false

	awesome.connect_signal("debug::error", function (err)
		-- Make sure we don't go into an endless error loop
		if in_error then return end

		in_error = true

		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err)
		})

		in_error = false
	end)
end


-- Load theme:
beautiful.init("~/.config/awesome/components/theme/theme.lua")

-- Define default terminal and editor:
terminal = "kitty"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
	awful.layout.suit.floating,
	awful.layout.suit.fair,
	awful.layout.suit.tile,
	awful.layout.suit.tile.bottom,
}


-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
	awful.button({ }, 1, function(t) t:view_only() end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({ }, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
		client.focus:toggle_tag(t)
		end
	end),
	awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
	awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)


local tasklist_buttons = gears.table.join(
	awful.button({ }, 1, function (c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal(
				"request::activate",
				"tasklist",
				{raise = true}
			)
		end
	end),
	awful.button({ }, 3, function()
		awful.menu.client_list({ theme = { width = 250 } })
	end),
	awful.button({ }, 4, function ()
		awful.client.focus.byidx(1)
	end),
	awful.button({ }, 5, function ()
		awful.client.focus.byidx(-1)
	end)
)


local function set_wallpaper(s)
	if beautiful.wallpaper then
		beautiful.wallpaper(s)
	else
		gears.wallpaper.set("#323232")
	end
end




-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)


-- Prepare each screen:
awful.screen.connect_for_each_screen(function(s)
	set_wallpaper(s)

	-- Each screen has its own tag table.
	awful.tag(workspaces.tags, s, awful.layout.layouts[1])

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()

	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
	awful.button({ }, 1, function () awful.layout.inc( 1) end),
	awful.button({ }, 3, function () awful.layout.inc(-1) end),
	awful.button({ }, 4, function () awful.layout.inc( 1) end),
	awful.button({ }, 5, function () awful.layout.inc(-1) end)))

	-- Create a taglist widget
	s.mytaglist = widget_helper.factorize_widget(awful.widget.taglist({
		screen  = s,
		filter  = awful.widget.taglist.filter.all,

		style = {
			shape = function (cr, w, h) gears.shape.rounded_rect(cr, w, h, 7) end
		},

		buttons = taglist_buttons
	}))

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist {
		screen  = s,
		filter  = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons
	}

	-- Create the wibox
	s.mywibox = awful.wibar({
		position = "top",
		screen = s,
		height = dpi(26),
		border_width = dpi(6),
		bg = "#00000000"
	})

	-- Add widgets to the wibox
	s.mywibox:setup {
		{ -- widgets left
			require("components.widgets.logo"),
			s.mytaglist,
			widget_helper.factorize_widget(s.mylayoutbox),
			widget_helper.factorize_widget(s.mypromptbox),
			layout = wibox.layout.fixed.horizontal,
		},

		nil, -- widgets middle

		{ -- widgets right
			--widget_helper.factorize_widget(wibox.widget.systray()),

			require("components.widgets.network"),
			require("components.widgets.calendar"),
			require("components.widgets.clock"),
			require("components.widgets.system"),

			layout = wibox.layout.fixed.horizontal,
		},

		layout = wibox.layout.align.horizontal,
	}
end)


-- Set keys
globalkeys = require("components.keys_global")
root.keys(globalkeys)


-- Button bindings for windows:
clientbuttons = gears.table.join(
	awful.button(
		{ }, 1,
		function (c)
			c:emit_signal("request::activate", "mouse_click", {raise = true})
		end
	),

	awful.button(
		{ modkey }, 1,
		function (c)
			c:emit_signal("request::activate", "mouse_click", {raise = true})
			awful.mouse.client.move(c)
		end
	),

	awful.button(
		{ modkey }, 3,
		function (c)
			c:emit_signal("request::activate", "mouse_click", {raise = true})
			awful.mouse.client.resize(c)
		end
	)
)


-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = { },
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = require("components.keys_client"),
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap+awful.placement.no_offscreen
		}
	},

	-- Floating clients.
	{
		rule_any = {
			instance = {
				"DTA",  -- Firefox addon DownThemAll.
				"copyq",  -- Includes session name in class.
				"pinentry",
			},

			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"MessageWin",  -- kalarm.
				"Sxiv",
				"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
				"Pcmanfm"
			},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester",  -- xev.
			},

			role = {
				"AlarmWindow",  -- Thunderbird's calendar.
				"ConfigManager",  -- Thunderbird's about:config.
				"pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
			}
		},

		properties = { floating = true }
	},

	-- Add titlebars to normal clients and dialogs
	{
		rule_any = {
			type = { "normal", "dialog" }
		},

		properties = { titlebars_enabled = true }
	},
}


-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
	c.shape = beautiful.border_shape

	-- Set the windows at the slave,
	-- i.e. put it at the end of others instead of setting it master.
	-- if not awesome.startup then awful.client.setslave(c) end
	if awesome.startup
	and not c.size_hints.user_position
	and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end
end)


-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal(
	"request::titlebars",
	function(c)
		-- buttons for the titlebar
		local buttons = gears.table.join(
			awful.button({ }, 1, function()
				c:emit_signal("request::activate", "titlebar", {raise = true})
				awful.mouse.client.move(c)
			end),

			awful.button({ }, 3, function()
				c:emit_signal("request::activate", "titlebar", {raise = true})
				awful.mouse.client.resize(c)
			end)
		)

		awful.titlebar(c, { }) : setup {
			{ -- Left			
				{
					align = "center",
					widget = wibox.widget.textbox("  ")
				},

				{ -- Title
					align  = "center",
					widget = awful.titlebar.widget.titlewidget(c)
				},

				layout  = wibox.layout.fixed.horizontal
			},

			{ -- Middle
				--buttons = buttons,
				layout  = wibox.layout.flex.horizontal
			},

			{ -- Right
				awful.titlebar.widget.floatingbutton (c),
				awful.titlebar.widget.maximizedbutton(c),
				awful.titlebar.widget.stickybutton   (c),
				awful.titlebar.widget.ontopbutton    (c),
				awful.titlebar.widget.closebutton    (c),
				layout = wibox.layout.fixed.horizontal()
			},

			layout = wibox.layout.align.horizontal
		}
	end
)


-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal(
	"mouse::enter",

	function(c)
		c:emit_signal("request::activate", "mouse_enter", {raise = false})
	end
)


client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)