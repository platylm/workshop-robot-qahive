*** Settings ***
Library     RequestsLibrary
Library     JsonValidator
Library     OperatingSystem
Library     JSONLibrary

Resource    ./resources/authentication.resource
Resource    ./resources/user-service.resource
Resource    ./resources/book-service.resource

*** Variables ***
${isbn}    9781449365035

*** Test Cases ***
GET user profile should be return 200 and book list of this user
    &{user}=    Create Dictionary    userName=platylm    password=Pukkad01@
    Create Session    userProfile    url=https://demoqa.com
    ${token}    Generate Token    ${user}[userName]    ${user}[password]
    ${userId}    Login    ${user}[userName]    ${user}[password]
    Get UserID    ${userId}
    Add Book    ${userId}    ${isbn}

Delete all Books
    &{user}=    Create Dictionary    userName=platylm    password=Pukkad01@
    Create Session    userProfile    url=https://demoqa.com
    ${token}    Generate Token    ${user}[userName]    ${user}[password]
    ${userId}    Login    ${user}[userName]    ${user}[password]
    Delete Books    ${userId}