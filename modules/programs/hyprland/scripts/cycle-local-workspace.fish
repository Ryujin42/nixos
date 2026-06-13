#!/usr/bin/env fish

set direction $argv[1]

set current (hyprctl activeworkspace -j | jq '.id')

set monitor (hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')


switch $monitor
    case DP-3
        set base 0

    case DP-1
        set base 10

    case DP-2
        set base 20

    case '*'
        exit 1
end


# Default: 5 workspaces
set max 5


# Find highest non-empty workspace between 6-10
for i in (seq 10 -1 6)

    set ws_id (math $base + $i)

    set clients (hyprctl clients -j | jq "[.[] | select(.workspace.id == $ws_id)] | length")

    if test $clients -gt 0
        set max $i
        break
    end
end


# Convert global workspace to local
set local (math $current - $base)


if test "$direction" = "next"

    set next (math $local + 1)

    if test $next -gt $max
        set next 1
    end


else if test "$direction" = "prev"

    set next (math $local - 1)

    if test $next -lt 1
        set next $max
    end

end


hyprctl dispatch workspace (math $base + $next)