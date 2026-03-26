*** Settings ***
Test Setup        Open Browser To Login Page
Test Teardown     Close Browser
Resource          ../resources/resource.robot

*** Test Cases ***
View Cart Items
    Login As Standard User
    Add Item To Cart
    Go To Cart
    Page Should Contain    Sauce Labs Backpack

Remove Item From Cart
    Login As Standard User
    Add Item To Cart
    Go To Cart
    Click Button    id=remove-sauce-labs-backpack

Continue Shopping From Cart
    Login As Standard User
    Add Item To Cart
    Go To Cart
    Click Button    id=continue-shopping