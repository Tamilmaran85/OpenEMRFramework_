*** Settings ***
Documentation   This file contains reusable keywords

Library     SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${BROWSER_NAME}         chrome
${URL}      https://demo.openemr.io/b/openemr

*** Keywords ***
Launch Browser
    Set Local Variable    ${driver_path}        chromedriver.exe

    IF    '${BROWSER_NAME}' == 'firefox'
        Set Local Variable    ${driver_path}        geckodriver.exe
    ELSE IF  '${BROWSER_NAME}' == 'edge'
        Set Local Variable    ${driver_path}        msedgedriver.exe
    ELSE IF  '${BROWSER_NAME}' == 'safari'
        Set Local Variable    ${driver_path}        safaridriver.exe
    END

    Open Browser      browser=${BROWSER_NAME}      executable_path=${EXECDIR}${/}drivers${/}${driver_path}
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Set Screenshot Directory    ${EXECDIR}${/}screenshot
    Go To    url=${URL}

End Browser
#    Capture Page Screenshot
    Close Browser