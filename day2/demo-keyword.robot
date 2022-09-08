*** Test Cases ***
Demo build in keyword
    Log    Hi    console=${True}    level=ERROR
    Sleep    1s
    Log    Bye

Demo custom keyword
    ${client name}=    Set Variable    PK
    Say Hello    ${client name}
    Say Hello    ${client name}2    WARN

Demo list variable
    @{products}=    Create List    celine    channel    dior
    Log    ${products}[0]
    Log    ${products}[1]
    Log Many    @{products}
    Log Many    ${products}

Demo dictionary variable
    &{user}=    Create Dictionary    firstname=Nareenart    lastname=Narunchon
    Log    Say hi ${user}[firstname] ${user}[lastname]
    Log    Say hi ${user["firstname"]} ${user["lastname"]}

*** Keywords ***
Say Hello
    [Arguments]    ${name}    ${level}=INFO
    Log    Hello ${name}    ${level}
    Sleep    1s
    Log    Bye