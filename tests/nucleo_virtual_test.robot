*** Settings ***
Resource    ../resources/common.robot
Resource    ../resources/keywords/nucleo_virtual_keywords.robot

Test Setup    Abrir navegador
Test Teardown    Fechar navegador

*** Test Cases ***
Cenário: Verificar navegação para Núcleo Virtual
    [Tags]    nucleo_virtual

    Dado que estou na página inicial
    E o botão Núcleo Virtual está visível
    Quando clico no botão Núcleo Virtual
    Então deve abrir a página do Núcleo Virtual

