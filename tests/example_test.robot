*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://biko.quijaua.com.br/

*** Test Cases ***
Validar Navegação Ambiente Virtual
    Open Browser    ${URL}    chrome    options=add_argument("--headless=new")    options=add_argument("--no-sandbox")  options=add_argument("--user-data-dir=/tmp")    options=add_argument("--disable-dev-shm-usage")    options=add_argument("--disable-gpu")    options=add_argument("--user-data-dir=/tmp")
    Wait Until Page Contains Element    xpath=//a[@class="nav-link" and normalize-space()="Ambiente Virtual"]
    Click Element    xpath=//a[@class="nav-link" and normalize-space()="Ambiente Virtual"]

    Wait Until Page Contains Element    css=h1
    Element Text Should Be    css=h1    Ambiente Virtual

    Page Should Contain    Cursos
    Page Should Contain    Materiais
    Page Should Contain    Avaliações

    [Teardown]    Close Browser
