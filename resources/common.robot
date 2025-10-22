*** Settings ***
Library    SeleniumLibrary
Resource    pages/login_page.robot
Resource    ../setup/setup_variables.robot

*** Variables ***
${BROWSER}       firefox


*** Keywords ***
Open Browser Custom
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys
    # Call Method    ${options}    add_argument    --headless
    Open Browser    ${URL}    ${BROWSER}    options=${options}
    Set Window Size    1920    1400
    # Maximize Browser Window

Abrir tela de login
    Open Browser Custom

Abrir navegador
    Open Browser Custom
    Wait Until Element Is Visible    //input[@name='email']    timeout=60s
    Realizar login    ${LOGIN_EMAIL}    ${LOGIN_PASSWORD}

Fechar navegador
    Close Browser
