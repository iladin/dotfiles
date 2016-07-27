#!/bin/bash
printf %$1s | tr ' ' 'I' |
    sed '
    s/IIIII/V/g
    s/IIII/IV/
    s/VV/X/g
    s/VIV/IX/
    s/XXXXX/L/g
    s/XXXX/XL/
    s/LL/C/g
    s/LXL/XC/
    s/CCCCC/D/g
    s/CCCC/CD/
    s/DD/M/g
    s/DCD/CM/
    '
    echo
