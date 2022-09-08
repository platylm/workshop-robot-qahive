*** Keywords ***
Add Book
    [Arguments]    ${token}    ${userId}
    # Post Book to user profile
    &{headerToken}    Create Dictionary    Authorization=Bearer ${token}[0]
    Create Session    bookStore    url=https://demoqa.com/BookStore/v1
    ${dataPostBook}    Catenate
    ...    {
    ...    "userId": "${userId}[0]",
    ...    "collectionOfIsbns": [{"isbn": "9781449365035" }]
    ...    }
    ${dataJson}    evaluate    json.loads('''${dataPostBook}''')    json

    ${resonseBookPost}    POST On Session    bookStore    /Books
    ...    json=${dataJson}    headers=${headerToken}    expected_status=anything