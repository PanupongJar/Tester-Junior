*** Settings ***
Test Setup        Open Browser To Login Page
Test Teardown     Close Browser
Resource          ../resources/resource.robot

*** Test Cases ***
Purchase Product Successfully
    Login As Standard User
    Add Item To Cart
    Go To Cart
    Start Checkout
    Fill Checkout Info    John    Doe    10110
    Finish Checkout
    Verify Purchase Success