*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Get bookstore list should be return 200 ok with book list
    [Documentation]    This case for api bookstore
    ${respons}   RequestsLibrary.GET    url=https://demoqa.com/BookStore/v1/Books
    Log     ${respons}

Get on session bookstore list should be return 200 ok with book list
    [Tags]    Onsession 
    Create Session    bookstore    url=https://demoqa.com/BookStore/v1/
    ${respons}    GET On Session    BookStore    /Books       
    ${responsProfile}    GET On Session    BookStore    /Book    params=ISBN=9781449325862
    Log    ${respons}