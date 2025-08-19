*** Settings ***
Resource    ../resources/common.robot
Resource    ../resources/pages/home_page.robot
Test Setup    Abrir navegador
Test Teardown    Fechar navegador

*** Test Cases ***
Cenário: Verificar botão e título na página inicial
    [Documentation]    Teste para verificar a presença do botão e título na página inicial
    
    Dado que estou na página inicial
    Quando verifico os elementos da página
    Então o botão deve estar visível
    E o título deve estar presente

*** Keywords ***
Dado que estou na página inicial
    # A página já é aberta no Setup

Quando verifico os elementos da página
    No Operation

Então o botão deve estar visível
    Verificar se o botão está visível

E o título deve estar presente
    Verificar se o título está presente
