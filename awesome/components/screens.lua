local screens = {}



-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

local lain = require("lain")

local volumearc_widget = require("awesome-wm-widgets.volumearc-widget.volumearc")
local batteryarc_widget = require("awesome-wm-widgets.batteryarc-widget.batteryarc")
local brightnessarc_widget = require("awesome-wm-widgets.brightnessarc-widget.brightnessarc")

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local workspaces = require("components.workspaces")
local screens = require("components.screens")


screens.connect = function(s)
	-- Wallpaper
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
	s.mytaglist = awful.widget.taglist {
		screen  = s,
		filter  = awful.widget.taglist.filter.all,
		buttons = taglist_buttons
	}

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
		height = dpi(23),
		border_width = dpi(5),
		--width = 150,
		shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 13) end
	})

	-- Add widgets to the wibox
	s.mywibox:setup {
		layout = wibox.layout.align.horizontal,

		{
			layout = wibox.layout.fixed.horizontal,
			s.mytaglist,
			s.mypromptbox,
		},
		--s.mytasklist, -- Middle widget
		nil,

		{ -- Right widgets
			wibox.widget.systray(),

			wibox.widget.textbox(""),
			wibox.widget.textbox("inga"),

			brightnessarc_widget(),

			volumearc_widget(),

			batteryarc_widget({
				show_current_level = true,
			}),

			wibox.widget.seperator,
			mytextclock,
			s.mylayoutbox,
			layout = wibox.layout.fixed.horizontal,
		},
	}
end