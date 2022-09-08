*** Keywords ***
Generate Token
    [Arguments]    ${username}    ${password}
    &{body}    Create Dictionary    userName=${username}    password=${password}
    ${response}    POST On Session    userProfile    /account/v1/GenerateToken    json=${body}    expected_status=anything
    Log    ${response.json()}
    ${token}    Get Elements    ${response.json()}    $.token
    &{headerToken}    Create Dictionary    Authorization=Bearer ${token}[0]
    Update Session    userProfile    headers=${headerToken}
    RETURN    ${token}
    # Return From Keyword    ${token}

Login 
    [Arguments]    ${username}    ${password}
    &{body}    Create Dictionary    userName=${username}    password=${password}
    ${responseUserId}    POST On Session    userProfile    /account/v1/Login    json=${body}    expected_status=anything
    ${userId}    Get Elements    ${responseUserId.json()}    $.userId
    ${token}    Get Elements    ${responseUserId.json()}    $.token
    &{headerToken}    Create Dictionary    Authorization=Bearer ${token}[0]
    Update Session    userProfile    headers=${headerToken}
    RETURN    ${userId}