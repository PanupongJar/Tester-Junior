*** Settings ***
Resource    ../resources/resource.robot
Suite Setup    Open Browser To Login Page
Suite Teardown    Close Browser

*** Test Cases ***
Logout Successfully
    Input Username    ${VALID USER}
    Input Password    ${VALID PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open

    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    id=logout_sidebar_link    5s
    Click Link    id=logout_sidebar_link

    Login Page Should Be Open