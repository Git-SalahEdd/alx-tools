#!/bin/bash

read -p "Please press 1 for Python, 2 for Bash or 3 for C file: " choice

if [[ "$choice" == "1" ]]; then
    ht="#!/usr/bin/python3"
elif [[ "$choice" == "2" ]]; then
    ht="#!/bin/bash"
elif [[ "$choice" == "3" ]]; then
	ht="#include <stdio.h>
#include <stlib.h>

/**
*main - Entry point
*Return: always 0 (success)
*/

int main(void)
{

}"
else
    echo "Unsupported choice. Please press 1 for Python or 2 for Bash."
    exit 1
fi

read -p "Please enter file name you'd like to create : " user_input

{
    echo "$ht"
} > "$user_input"

chmod +x "$user_input"
vi "$user_input"
