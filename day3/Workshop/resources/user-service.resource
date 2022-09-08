*** Keywords ***
Get UserID
    [Arguments]    ${token}    ${userId}
    # Get User Profile
    &{headerToken}    Create Dictionary    Authorization=Bearer ${token}[0]
    ${getProfile}    GET On Session    userProfile    /User/${userId}[0]
    ...    headers=${headerToken}    expected_status=anything
    Log    ${getProfile.json()}
    RETURN    ${getProfile}