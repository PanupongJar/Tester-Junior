*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource    ../resources/resource.robot

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    standard_user
    Input Password    secret_sauce
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Close Browser

Problem User Login
    Open Browser To Login Page
    Input Username    problem_user
    Input Password    ${VALID PASSWORD}
    Submit Credentials
    Page Should Contain Element    class=inventory_item
    [Teardown]    Close Browser

Performance Glitch User Login
    Open Browser To Login Page
    Input Username    performance_glitch_user
    Input Password    ${VALID PASSWORD}
    Submit Credentials
    Wait Until Element Is Visible    class=inventory_list    15s
    [Teardown]    Close Browser