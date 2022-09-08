*** Keywords ***
Generate Token
# Get Token
    &{header}    Create Dictionary    userName=platylm    password=Pukkad01@
    ${resonse}    POST On Session    userProfile    /GenerateToken
    ...    json=${header}    expected_status=anything
    Log    ${resonse.json()}
    ${token}    Get Elements    ${resonse.json()}    $.token
    # Set Test Variable    ${token}    ${token}
    RETURN    ${token}
    # Return From Keyword    ${token}

Login 
    [Arguments]
# Get UUID
    &{header}    Create Dictionary    userName=platylm    password=Pukkad01@
    ${resonseUserId}    POST On Session    userProfile    /Login
    ...    json=${header}    expected_status=anything
    ${userId}    Get Elements    ${resonseUserId.json()}    $.userId
    ${token}    Get Elements    ${resonseUserId.json()}    $.token
    # Set Test Variable    ${userId}    ${userId}
    RETURN    ${userId}    ${token}