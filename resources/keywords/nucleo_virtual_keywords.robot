*** Settings ***
Resource    ../pages/side_menu_page.robot
Resource    ../pages/nucleo_virtual_page.robot
Resource    ../locators/nucleo_virtual_locators.robot

*** Keywords ***
 Dado que estou na página inicial
    No Operation
E o botão Núcleo Virtual está visível
    Verificar se o botão do menu está visível    NUCLEO_VIRTUAL_LINK
Quando clico no botão Núcleo Virtual
    Clicar no botão do menu    NUCLEO_VIRTUAL_LINK
Então deve abrir a página do Núcleo Virtual
     Verificar se o título está presente

Verificar botão "Adicionar nova aula" está visível
    Wait Until Element Is Visible    ${ADICIONAR_NOVA_AULA_BTN}    timeout=10s
    Element Should Be Visible    ${ADICIONAR_NOVA_AULA_BTN}

Clicar no botão "Adicionar nova aula"
    Scroll Element Into View    ${ADICIONAR_NOVA_AULA_BTN}
    Click Element    ${ADICIONAR_NOVA_AULA_BTN}

Verificar botão "Limpar filtros" está visível
    Wait Until Element Is Visible    ${LIMPAR_FILTROS_BTN}    timeout=10s
    Element Should Be Visible    ${LIMPAR_FILTROS_BTN}

Clicar no botão "Limpar filtros"
    Click Element    ${LIMPAR_FILTROS_BTN}