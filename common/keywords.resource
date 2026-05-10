*** Settings ***
Resource    ../config/import.resource
Resource    ../common/variables.resource

*** Keywords ***
Setup-Open application
    Open Application
    ...    remote_url=${remote_url}
    ...    automationName=${automationName}
    ...    platformName=${platformName}
    ...    deviceName=${deviceName}
    ...    platformVersion=${platformVersion}
    ...    appPackage=${appPackage}
    ...    appActivity=${appActivity}
    ...    noReset=${noReset}

Teardown - Close application
    Close Application
    
Common - Click Element
    [Arguments]    ${locator}    
    Wait Until Element Is Visible    ${locator}
    Click Element    ${locator}
    
Common - Input Element
    [Arguments]    ${input_locator}    ${value}
    Wait Until Element Is Visible    ${input_locator}
#    Clear Text    ${input_locator}
    Input Text    ${input_locator}    ${value}

#Common - Input Current Date

