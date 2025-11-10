*** Settings ***
Library    SeleniumLibrary
Suite Setup    Set Screenshot Directory    2_web_login_automation/results
# OutputDir      2_web_login_automation/results


*** Variables ***
${URL}          http://the-internet.herokuapp.com/login
${BROWSER}      chrome
${RESULT_PATH}  2_web_login_automation/results

*** Keywords ***
Login And Verify
    [Arguments]    ${username}    ${password}    ${expected_message}    ${screenshot_name}
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id=username    ${username}
    Input Text    id=password    ${password}
    Click Button    css=button[type="submit"]
    Wait Until Page Contains    ${expected_message}    timeout=5s
    Capture Page Screenshot    ${RESULT_PATH}/${screenshot_name}.png
    Close Browser


*** Test Cases ***
Login Success
    [Documentation]    Verify user can login successfully
    Login And Verify    tomsmith    SuperSecretPassword!    You logged into a secure area!    login_success

Login Failed - Wrong Password
    [Documentation]    Verify error message when password is incorrect
    Login And Verify    tomsmith    Password!    Your password is invalid!    login_failed_wrong_password

Login Failed - Username Not Found
    [Documentation]    Verify error message when username is invalid
    Login And Verify    tomholland    Password!    Your username is invalid!    login_failed_invalid_username
