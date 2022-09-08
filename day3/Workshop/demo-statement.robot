*** Settings ***
Resource    ./resources/fizz-buzz-cal.resource.resource

*** Test Cases ***
Demo for loop
    @{products} =    Create List
    ...    iphone    android    nokia
    LOG    ${products}[0]
    FOR    ${product}    IN    @{products}
        Log    ${product}
    END

Demo fizz buzz checker
    Fizz Buzz Check    15