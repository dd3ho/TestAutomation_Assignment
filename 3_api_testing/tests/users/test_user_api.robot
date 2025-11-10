*** Settings ***
Resource          ../../resources/keywords.robot
Suite Setup    Setup Suite

*** Keywords ***
Setup Suite
    # Create Session With Auth
    Create Reqres Session


*** Test Cases ***
TC01 - Get User Profile Success
    [Documentation]    Verify API returns correct data for existing user
    ${response}=    Get User    12    200
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Set Variable    ${response.json()}
    Should Be Equal As Integers    ${json['data']['id']}    12
    Should Be Equal    ${json['data']['email']}       rachel.howell@reqres.in
    Should Be Equal    ${json['data']['first_name']}  Rachel
    Should Be Equal    ${json['data']['last_name']}   Howell
    Should Be Equal    ${json['data']['avatar']}      https://reqres.in/img/faces/12-image.jpg

TC02 - Get User Profile But Not Found
    [Documentation]    Verify API returns 404 when user does not exist
    ${response}=    Get User    1234    404
    # Log To Console    Status: ${response.status_code}
    Should Be Equal As Integers    ${response.status_code}    404
    Should Be Equal    ${response.text.strip()}    {}


# *** Test Cases ***
# TC01 - Verify Get User by ID
#     ${user}=    Get User By ID    2
#     Should Contain    ${user['data']['email']}    @reqres.in

# TC02 - Verify Create New User
#     ${new_user}=    Create New User    John Doe    QA Engineer
#     Should Contain    ${new_user['name']}    John Doe
