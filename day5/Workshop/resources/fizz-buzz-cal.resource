*** Keywords ***
Fizz Buzz Check
    [Arguments]    ${number}
    IF    ${number} % 3 == 0 and ${number} % 5 == 0
        Log    FizzBuzz
    ELSE IF    ${number} % 3 == 0
        Log    Fizz
    ELSE IF    ${number} % 5 == 0
        Log    Buzz
    ELSE
        Log    ${number}
    END