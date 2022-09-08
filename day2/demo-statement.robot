*** Test Cases ***
Demo if else statement
    ${age}=    Set Variable    20
    IF    ${age} > 20
        Log    can drink alcohol
    ELSE IF    ${age} == 20
        Log    can drink wine
    ELSE
        Log    drink coke
    END

Demo for loop
    @{products}=    Create List    iPhone    Android    Nokia
    FOR    ${product}    IN    @{products}
        Log    ${product} 
    END

Demo if else FizzBuzz
    FizzBuzz Checker    ${15}
    FizzBuzz Checker    ${3}
    FizzBuzz Checker    ${5}
    FizzBuzz Checker    ${4}

*** Keywords ***
FizzBuzz Checker
    [Arguments]    ${number}
    IF    ${number}%${3}==0 and ${number}%${5}==0
        Log    FizzBuzz
    ELSE IF    ${number}%${3}==0
        Log    Fizz
    ELSE IF    ${number}%${5}==0
        Log    Buzz 
    ELSE
        Log    ${number}
    END