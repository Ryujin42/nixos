#!/usr/bin/env fish

set direction $argv[1]

set current_ws (hyprctl activeworkspace -j | jq '.id')

set monitor (hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')
set local_ws $current_ws

switch $monitor
    case DP-3
        
        if test "$direction" = "left"
            set target (math $local_ws + 20)

        else if test "$direction" = "right"
            set target (math $local_ws + 10)
        end

    case DP-1
        if test "$direction" = "left"
            set target (math $local_ws - 10)

        else if test "$direction" = "right"
            set target (math $local_ws + 10)
        end

    case DP-2
        if test "$direction" = "left"
            set target (math $local_ws - 10)

        else if test "$direction" = "right"
            set target (math $local_ws - 20)
        end
end

hyprctl dispatch movetoworkspace $target