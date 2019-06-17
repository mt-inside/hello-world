#!/usr/bin/env bash

function handle ()
{
    {
        echo HTTP/1.0 200
        echo Content-Type: text/plain
        echo
        cat /etc/namer/name.txt
    } | socat \
        TCP-LISTEN:8080,crlf,reuseaddr \
        STDIO
}

echo Ok.

while handle
do
    echo
done
