#!/usr/bin/env osascript

on run argv
	set f to item 1 of argv

	with timeout of (30 * 60) seconds
		tell application "Evernote"
			activate
			delay 300

			-- Set date to 1990 so it finds all notes
			set matches to find notes "created:19900101"
			-- export to file set above
			export matches to f

			quit
		end tell
	end timeout
end run
