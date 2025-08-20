*** Settings ***
Library    SeleniumLibrary
Resource    ../locators/login_locators.robot

*** Keywords ***
Realizar login
    [Arguments]    ${email}    ${password}
    Wait Until Element Is Visible    ${LOGIN_EMAIL_INPUT}    timeout=10s
    Input Text    ${LOGIN_EMAIL_INPUT}    ${email}
    Input Text    ${LOGIN_PASSWORD_INPUT}    ${password}
    Click Button    ${LOGIN_SUBMIT_BUTTON}
    Wait Until Page Contains Element    id=algum-elemento-da-home    timeout=10s    # Ajuste conforme o elemento esperado após login
