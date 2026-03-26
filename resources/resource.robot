*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${SERVER}             saucedemo.com
${BROWSER}            chrome
${VALID USER}         standard_user
${VALID PASSWORD}     secret_sauce
${LOGIN URL}          https://www.${SERVER}
${WELCOME URL}        https://www.${SERVER}/inventory.html
${ERROR URL}          https://www.${SERVER}

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    id=user-name    10s

Close Browser
    Close All Browsers

# 🔥 reset ใหม่ทุก test
Reset App State
    Go To    ${LOGIN URL}
    Wait Until Element Is Visible    id=user-name    10s

Login As Standard User
    Reset App State
    Input Text    id=user-name    ${VALID USER}
    Input Text    id=password     ${VALID PASSWORD}
    Click Button  id=login-button
    Wait Until Location Contains    inventory.html    10s

Add Item To Cart
    Wait Until Element Is Visible    id=add-to-cart-sauce-labs-backpack    10s
    Click Button    id=add-to-cart-sauce-labs-backpack

Go To Cart
    Wait Until Element Is Visible    class=shopping_cart_link    10s
    Click Element    class=shopping_cart_link

Start Checkout
    Wait Until Element Is Visible    id=checkout    10s
    Click Button    id=checkout

Fill Checkout Info
    [Arguments]    ${fname}    ${lname}    ${zip}
    Wait Until Element Is Visible    id=first-name    10s
    Input Text    id=first-name    ${fname}
    Input Text    id=last-name     ${lname}
    Input Text    id=postal-code   ${zip}
    Click Button    id=continue

Finish Checkout
    Wait Until Element Is Visible    id=finish    10s
    Scroll Element Into View        id=finish
    Click Button                   id=finish

Verify Purchase Success
    Wait Until Page Contains    Thank you for your order    15s

Go To Login Page
    Go To    ${LOGIN URL}
    Wait Until Element Is Visible    id=user-name    10s

Input Username
    [Arguments]    ${username}
    Input Text    id=user-name    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    id=password    ${password}

Submit Credentials
    Click Button    id=login-button

Welcome Page Should Be Open
    Wait Until Location Contains    /inventory.html    10s
    Location Should Be    ${WELCOME URL}
    Title Should Be    Swag Labs

Login Page Should Be Open
    Title Should Be    Swag Labs
    Wait Until Element Is Visible    id=user-name    10s