#!/bin/sh

find . -name "*.[h,c]" -exec indent '{}' \;
find . -name "*.h~" -exec rm '{}' \; -o -name "*.c~" -exec rm '{}' \;
find -name "*.[hc]" | xargs perl -pi -e 's/\t/    /g'
