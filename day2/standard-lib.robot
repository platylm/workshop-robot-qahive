*** Settings ***
Library    Collections
Library    DateTime
Library    Dialogs
Library    OperatingSystem
Library    String

*** Test Cases ***
Test Convert to String
    ${str}    Convert To String    1
    Log    ${str}

Test Create List
    @{list}    Create List    a    b    c
    Log    ${list}[1]

Tet Evaluate
    ${sum}    Evaluate    1+3
    Log    ${sum}

Test Get Count
    @{list}    Create List    a    b    c    d
    ${count}    Get Count    ${list}    a
    Log    ${count}

Test Get Length
    ${count}    Get Length    123456789
    Log    ${count}

Test Log Many
    @{list}    Create List    1    2    3    4
    Log Many    Test    ${list}

Test Append To List
    @{list}    Create List    1    2    3    4
    Append To List    ${list}    5   
    Log    ${list}

Test Combine List
    @{list}    Create List    1    2    3    4
    @{list2}    Create List    a    b    c
    ${result}=    Combine Lists    ${list}    ${list2}
    Log    ${result}

Test Count Values In List
    @{list}    Create List    a    b    c    a
    ${count}    Count Values In List    ${list}    a
    Log    ${count}

Test Log List
    @{list}    Create List    a    b    c    a
    Log List    ${list}

Test Remove Duplicates
    @{list}    Create List    a    b    b    c    a
    ${result}=    Remove Duplicates    ${list}
    Log    ${result}

Test Remove From List
    @{list}    Create List    a    b    b    c    a
    ${result}=    Remove From List    ${list}    2
    Log    ${result}
    Log    ${list}

Test Add Time To Date
    ${newDate}=    Add Time To Date    2022-09-06 12:05:03.111    1 day
    Log    ${newDate}

Test Get Current Date
    ${current}=    Get Current Date
    Log    ${current}

Test Pause Execution
    Log    test
    Pause Execution
    Log    test1

Test OperatingSystem Library
    Create File    ./example.txt    สวัสวดี    encoding=UTF-8

Test Get File
    ${data_file}=    Get File    ./example.txt    encoding=UTF-8

Test Replace String
    ${str}=    Replace String    Hello,world    world    PK
    Log    ${str}

Test Shpuld Be Equal
    ${str}=    Set Variable    a
    Should Be Equal    ${str}    a
    Should Be Lower Case    aaaaaa

Test Dictionary should contain value
    &{test}=    Create Dictionary    firstname=Nareenart    lastname=Narunchon    
    &{test2}=    Create Dictionary    lastname=Narunchon    firstname=Nareenart
    Dictionaries Should Be Equal    ${test}    ${test2}
    Should Be Equal    ${test}[firstname]    Nareenart
    Should Be Equal    ${test}[lastname]    Narunchon

Test count digit
    ${count}    Get Length    0890890891
    Should Be True    ${count}==10