*** Settings ***

Library    AppiumLibrary

*** Test Cases ***

Deve abrir o app na tela home

    Open Application    http://localhost:4723
    ...    platformName=Android
    ...    automationName=UiAutomator2
    ...    deviceName=Android Emulator
    ...    app=${EXECDIR}/app/yodapp-beta.apk
    ...    udid=emulator-5554
    ...    autoGrantPermissions=${True}

    Wait Until Page Contains    Yodapp    10s

    Close Application


# robot -d ./logs tests/home.robot 

