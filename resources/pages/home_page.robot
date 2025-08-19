*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${HOME_BUTTON}    id=button-click
${HOME_TITLE}    css=h1

*** Keywords ***
Verificar se o botão está visível
    Wait Until Element Is Visible    ${HOME_BUTTON}    timeout=10s

Clicar no botão
    Click Element    ${HOME_BUTTON}

Verificar se o título está presente
    Wait Until Element Is Visible    ${HOME_TITLE}    timeout=10s
    Element Should Be Visible    ${HOME_TITLE}
