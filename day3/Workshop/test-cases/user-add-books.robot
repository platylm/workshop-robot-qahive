*** Settings ***
Library    RequestsLibrary
Library     JsonValidator

Resource    ../resources/authentication.resource
Resource    ../resources/user-service.resource
Resource    ../resources/book-service.resource

*** Variables ***
${isbn}    9781449365035

*** Test Cases ***
User able to add a new book and should in user profile
    [Documentation]
    ...    1. login
    ...    2. clear all books
    ...    3. Add new book
    ...    4. Verify new book show under user profile
    #Arrange
    &{user}=    Create Dictionary    userName=platylm    password=Pukkad01@
    Create Session    userProfile    url=https://demoqa.com
    ${userId}    Login    ${user}[userName]    ${user}[password]
    Delete Books    ${userId}
    #Act
    Add Book    ${userId}    ${isbn}
    #Assert
    ${profileResp}    Get UserID    ${userId}
    # Log    ${profileResp}
    ${isbns}=    JsonValidator.Get Elements    ${profileResp}    $.books[0].isbn
    Should Be Equal    ${isbn}    ${isbns}[0]