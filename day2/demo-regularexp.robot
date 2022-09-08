*** Settings ***
Library    String

*** Test Cases ***
Demo regular expression (regexp) email
    ${result}=    Get Regexp Matches    nareenart@tcrbank.com    [a-zA-Z0-9]+@tcrbank.com
    Should Match Regexp    nareenart@tcrbank.com    ^[a-zA-Z0-9]+@tcrbank.com

Demo regular expression (regexp) phone number thailand start 66 and 11 number length
    ${result}=    Get Regexp Matches    66846730268    66+[0-9]{9}$
    Should Match Regexp    66846730268    66+[0-9]{9}$