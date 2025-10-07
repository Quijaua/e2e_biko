*** Settings ***
Library    SeleniumLibrary
Resource    ../locators/side_menu_locators.robot
Resource    ../locators/pre_cadastro_locators.robot

*** Keywords ***
Clicar no botão do menu
    [Arguments]    ${botao}
    ${locator}=    Get Variable Value    ${${botao}}
    Scroll Element Into View    ${locator}
    Click Element    ${locator}

Verificar se o botão do menu está visível
    [Arguments]    ${botao}
    ${locator}=    Get Variable Value    ${${botao}}
    Wait Until Element Is Visible    ${locator}    timeout=60s
    Element Should Be Visible    ${locator}
