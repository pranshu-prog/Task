*** Settings ***
Library    SeleniumLibrary 
Resource    ../Utility/commonUtil.robot
Resource    ../Utility/locators.robot

*** Test Cases ***
Load URL of bakerykart
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    Open the Bakerykart
    Click into Item
    sleep and close


*** Keywords ***
User is allowed to open Bakerykart
    Open Browser    ${URL}    ${Browser}

Maximize the window
    Maximize Browser Window
    Wait Text
Open the Bakerykart
    Wait Until Element Is Visible   ${explore}  timeout=10s
    Click Element   ${explore}
    ${count}=   Get Element Count  xpath=//div[@class='product-listing']/ul/li
    Log to Console    ${Count}
    
    
    FOR  ${k}  IN RANGE    1   ${count}
        ${prod_Name}=    Get Text    xpath=//div[@class='product-listing']/ul/li[${k}]/div[2]/h3
        Log to Console    ${prod_Name}       
        Scroll Element Into View    xpath=//div[@class='product-listing']/ul/li[${k}]/div[2]/h3
        Exit For Loop If     '${prod_Name}' == 'Cacao Barry Cara Crakine'
    END

    Set Suite Variable  ${Expected_Item}  xpath=//div[@class='product-listing']/ul/li[${k}]/div[2]/h3
    
Click into Item
    Click Element  ${Expected_Item}
    
sleep and close
    sleep    3    
    Close Browser
