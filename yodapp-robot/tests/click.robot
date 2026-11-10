*** Settings ***

Library    AppiumLibrary

*** Variables ***
${START_BUTTON}    QAX

*** Test Cases ***

Deve realizar um click simples

    Open Application    http://localhost:4723
    ...    platformName=Android
    ...    automationName=UiAutomator2
    ...    deviceName=Android Emulator
    ...    app=${EXECDIR}/app/yodapp-beta.apk
    ...    udid=emulator-5554
    ...    autoGrantPermissions=${True}

    Wait Until Page Contains        ${START_BUTTON}     10s
    Click Text                      ${START_BUTTON}

    ${hamburger_menu}             Set Variable    xpath=//*[@content-desc="Open navigation drawer"]
    Wait Until Element Is Visible  ${hamburger_menu}  10s
    click element                  ${hamburger_menu}

    ${click_em_botoes}             Set Variable    xpath=//*[@resource-id="com.qaxperience.yodapp:id/rvNavigation"]//*[@text="Clique em Botões"]
    Click Element                  ${click_em_botoes}
    Wait Until Page Contains       Clique simples    10s
   
    Close Application



# robot -d ./logs tests/click.robot 




