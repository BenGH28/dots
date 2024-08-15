#!/usr/bin/env bash
text=$(curl -s "https://wttr.in/$1?format=1")
if [[ -n $text ]]; then
    text=$(echo "$text" | sed -E "s/\s+/ /g")
    tooltip=$(curl -s "https://wttr.in/$1?format=4")
    if [[ -n $tooltip ]]; then
        tooltip=$(echo "$tooltip" | sed -E "s/\s+/ /g")
        echo "{\"text\":\"$text\", \"tooltip\":\"$tooltip\"}"
    fi
else
    echo '{"text":"error", "tooltip":"error"}'
fi
