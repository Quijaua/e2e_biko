*** Settings ***
Library   SeleniumLibrary
Resource    ../locators/nucleo_virtual_locators.robot


*** Keywords ***
 Verificar se o título está presente
    Wait Until Element Is Visible    ${NUCLEO_VIRTUAL_TITLE}    timeout=10s
    Element Should Be Visible    ${NUCLEO_VIRTUAL_TITLE}