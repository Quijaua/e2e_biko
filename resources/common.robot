*** Settings ***
Library    SeleniumLibrary
Resource    pages/login_page.robot
Resource    ../setup/setup_variables.robot

*** Variables ***
${BROWSER}    chrome

*** Keywords ***
Abrir tela de login
    Open Browser    ${URL}  ${BROWSER}
    Maximize Browser Window
Abrir navegador
    Open Browser    ${URL}  ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    //input[@name='email']    timeout=60s
    Realizar login    ${LOGIN_EMAIL}    ${LOGIN_PASSWORD}

Fechar navegador
    Close Browser