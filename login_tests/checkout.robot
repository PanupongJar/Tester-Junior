*** Settings ***
Test Setup        Open Browser To Login Page
Test Teardown     Close Browser
Resource          ../resources/resource.robot

*** Test Cases ***
Checkout Without Last Name
    Login As Standard User
    Add Item To Cart
    Go To Cart
    Start Checkout

    Input Text    id=first-name    John
    Input Text    id=postal-code   10110
    Click Button    id=continue

    Page Should Contain    Error

Checkout Without Zip Code
    Login As Standard User
    Add Item To Cart
    Go To Cart
    Start Checkout

    Input Text    id=first-name    John
    Input Text    id=last-name     Doe
    Click Button    id=continue

    Page Should Contain    Error