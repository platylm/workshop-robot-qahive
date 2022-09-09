*** Settings ***
Suite Setup    Custom Suite Setup
Test Setup    Custom Test Setup
Test Teardown    Custom Test Teardown  

Library    RequestsLibrary
Library     JsonValidator
Library    Collections
Library    String

Resource    ../resources/authentication.resource
Resource    ../resources/user-service.resource
Resource    ../resources/book-service.resource

*** Variables ***
${isbn}    9781449365035
${isbn2}    9781449331818

*** Test Cases ***
User able to add a new book and should in user profile
    [Documentation]
    ...    1. login
    ...    2. clear all books
    ...    3. Add new book
    ...    4. Verify new book show under user profile
    #Act
    Add Books    ${userId}    ${isbn}
    #Assert
    ${profileResp}    Get UserID    ${userId}
    ${isbns}=    JsonValidator.Get Elements    ${profileResp}    $.books[0].isbn
    Should Be Equal    ${isbn}    ${isbns}[0]

User able to add multiple books from different time
    #Act
    Add Books    ${userId}    ${isbn}
    Add Books    ${userId}    ${isbn2}
    #Assert
    ${profileResp}    Get UserID    ${userId}
    ${isbns}=    JsonValidator.Get Elements    ${profileResp}    $.books[*].isbn
    Should Be Equal    ${isbn}    ${isbns}[0]
    Should Be Equal    ${isbn2}    ${isbns}[1]

User able to add multiple books from one time
    #Act
    Add books    ${userId}    ${isbn}    ${isbn2}
    #Assert

*** Keywords ***
Custom Suite Setup
    &{user}=    Create Dictionary    userName=platylm    password=Pukkad01@
    Create Session    userProfile    url=https://demoqa.com
    ${headerToken}    Generate Token    ${user}[userName]    ${user}[password]
    ${userId}    Login    ${user}[userName]    ${user}[password]
    Set Suite Variable    $headerToken    ${headerToken}
    Set Suite Variable    $userId    ${userId}

Custom Test Setup
    Create Session    userProfile    url=https://demoqa.com    headers=${headerToken}
    Delete Books    ${userId}
    Set Test Variable    $userId    ${userId}

Custom Test Teardown
    Delete Books    ${userId}
    Delete All Sessions