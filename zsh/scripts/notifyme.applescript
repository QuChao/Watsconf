#!/usr/bin/env osascript
# Ref: http://frantic.im/notify-on-completion
on run argv
	tell application "System Events"
		set frontApp to name of first application process whose frontmost is true
		if frontApp is not "Terminal" then
			set notifBody to item 1 of argv
			set errorCode to item 2 of argv
			set exeTime to item 3 of argv
			set notifTitle to "CMD finished"
			if exeTime is not "0s" then
				set notifTitle to notifTitle & " (" & exeTime & ")"
			end if
			if errorCode is not "0" then
				set notifTitle to notifTitle & " with error code #" & errorCode
			end if
			display notification notifBody with title notifTitle
		end if
	end tell
end run
