#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/System/Applications/Messages.app"
dockutil --no-restart --add "/Applications/Safari.app"
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/Firefox.app"
dockutil --no-restart --add "/System/Applications/Mail.app"
dockutil --no-restart --add "/Applications/Notion.app"
dockutil --no-restart --add "/Applications/Notion Calendar.app"
dockutil --no-restart --add "/Applications/zoom.us.app"
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/Spotify.app"
dockutil --no-restart --add "/System/Applications/System Settings.app"

defaults write com.apple.dock orientation left

killall Dock
