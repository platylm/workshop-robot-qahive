*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
POST user with wrong password format should return 400 bad request
    Create Session    user    url=https://demoqa.com/Account/v1
    &{body}=    Create Dictionary    userName=platylm1    password=12345
    ${response_user}=    POST On Session    user    url=/User    json=${body}    expected_status=anything

POST user with valid format should return 201 created
    Create Session    user    url=https://demoqa.com/Account/v1
    &{body}=    Create Dictionary    userName=platylm3    password=P@ssword1234
    ${response_user}=    POST On Session    user    url=/User    json=${body}    expected_status=anything
    Log    ${response_user.json()}

Get user with UUID should be
    Create Session    user    url=https://demoqa.com/Account/v1
    ${response_uuid}=    GET On Session    user    url=/user/b91b2a68-3d21-4f5e-9459-d4b852c96292    expected_status=anything
    Log    ${response_uuid.json()}