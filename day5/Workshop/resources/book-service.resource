*** Keywords ***
Add books
    [Arguments]    ${userId}    @{isbns}
    @{isbns list}    Create List    
    FOR    ${isbn}    IN    @{isbns}
        ${isbn json}    Set Variable    { "isbn": "${isbn}" }
        Append To List    ${isbns list}    ${isbn json}
    END
    ${isbns json}    Catenate    SEPARATOR=,    @{isbns list}
    ${dataPostBook}    Catenate
    ...    {
    ...    "userId": "${userId}[0]",
    ...    "collectionOfIsbns": [${isbns json}]
    ...    }
    ${dataJson}    Evaluate    json.loads('''${dataPostBook}''')    json
    ${resonseBookPost}    POST On Session    userProfile    /BookStore/v1/Books    json=${dataJson}    expected_status=anything

Delete Books
    [Arguments]    ${userId}
    ${body}=    Create Dictionary    UserId=${userId}[0]
    ${resonseBook}    Delete On Session    userProfile    /BookStore/v1/Books    params=${body}    expected_status=204