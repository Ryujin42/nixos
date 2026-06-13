#!/usr/bin/env fish
set ws $argv[1]
set monitor (hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')

switch $monitor
    case DP-3
        set offset 0
    case DP-1
        set offset 10
    case DP-2
        set offset 20
    case '*'
        exit 1
end 

hyprctl dispatch workspace (math $offset + $ws)