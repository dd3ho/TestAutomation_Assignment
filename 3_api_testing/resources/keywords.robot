*** Settings ***
Library    RequestsLibrary
Library    BuiltIn
# Library    JSONLibrary
Resource   variables.robot

*** Keywords ***
# Create Session With Auth
#     Create Session    api    ${BASE_URL}    headers=${HEADERS}

Create Reqres Session
    Create Session    reqres    ${BASE_URL}    headers=${HEADERS}


Get User
    [Arguments]    ${user_id}    ${expected_status}=any
    ${response}=    GET On Session    reqres    /users/${user_id}    expected_status=${expected_status}
    RETURN    ${response}

# Get User By ID
#     [Arguments]    ${user_id}
#     ${response}=    GET On Session    api    /users/${user_id}
#     Should Be Equal As Integers    ${response.status_code}    200
#     # ${json}=    Load JSON From String    ${response.content}
#     # ${json}=    Evaluate    json.loads(${response.content})    json
#     ${json}=    Set Variable    ${response.json()}
#     RETURN    ${response.json()}


# Create New User
#     [Arguments]    ${name}    ${job}
#     ${body}=    Create Dictionary    name=${name}    job=${job}
#     ${response}=    POST On Session    api    /users    json=${body}
#     Should Be Equal As Integers    ${response.status_code}    201
#     Log To Console    User Created: ${response.json()}
#     RETURN    ${response.json()}
