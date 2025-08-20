*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}    http://localhost:3000    # Ajuste a URL conforme necessário

*** Keywords ***
Abrir navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Realizar login    user@example.com    senha123

Fechar navegador
    Close Browser
