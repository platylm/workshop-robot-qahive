*** Variables ***
${dataTest}    Test Suite Value

*** Test Cases ***
Local variable
    ${data}    Set Variable    Test1
    Set Test Variable    ${data1}    ${data}
    Print data
    Log    ${data}

Local Test
    Log    ${dataTest}

Print animal
    Variable inside variable    en
    Variable inside variable    th

*** Keywords ***
Print data
    Log    ${data1}
    Log    ${dataTest}

Variable inside variable
    [Arguments]    ${language}
    ${animal_th}    Set Variable    ไก่
    ${animal_en}    Set Variable    chicken
    Log    ${animal_${language}}