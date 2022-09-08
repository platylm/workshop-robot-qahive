*** Settings ***
Library     RequestsLibrary
Library     JsonValidator
Library     OperatingSystem
Library     JSONLibrary

Resource    ./resources/authentication.resource
Resource    ./resources/user-service.resource
Resource    ./resources/book-service.resource


*** Test Cases ***
GET user profile should be return 200 and book list of this user
    Create Session    userProfile    url=https://demoqa.com/account/v1
    ${token}    Generate Token
    ${userId}    Login
    Get UserID    ${token}    ${userId}
    Add Book    ${token}    ${userId}