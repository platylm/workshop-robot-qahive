*** Keywords ***
Get UserID
    [Arguments]    ${userId}
    # Get User Profile
    ${getProfile}    GET On Session    userProfile    /account/v1/User/${userId}[0]    expected_status=anything
    Log    ${getProfile.json()}
    RETURN    ${getProfile.json()}