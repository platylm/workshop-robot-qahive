*** Keywords ***
Add Book
    [Arguments]    ${userId}    ${isbn}
    ${dataPostBook}    Catenate
    ...    {
    ...    "userId": "${userId}[0]",
    ...    "collectionOfIsbns": [{"isbn": "${isbn}" }]
    ...    }
    ${body}    Evaluate    json.loads('''${dataPostBook}''')    json

    ${resonseBookPost}    POST On Session    userProfile    /BookStore/v1/Books    json=${body}    expected_status=201

Delete Books
    [Arguments]    ${userId}
    ${body}=    Create Dictionary    UserId=${userId}[0]
    ${resonseBook}    Delete On Session    userProfile    /BookStore/v1/Books    params=${body}    expected_status=204