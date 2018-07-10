#!/bin/sh

url="https://www.reddit.com/message/unread/.json?feed=84d16d85e5824e41facf260ffd5d0599dbda7945&user=got4n"
unread=$(curl -sf "$url" | jq '.["data"]["children"] | length')

case "$unread" in
    ''|*[!0-9]*)
	unread=0
esac;

if [ "$unread" -gt 0 ]; then
    echo "#1 $unread"
else
    echo "#2"
    fi
