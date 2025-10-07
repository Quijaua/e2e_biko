*** Settings ***
Resource    ../resources/common.robot
Resource    ../resources/pages/side_menu_page.robot
Resource    ../resources/keywords/pre_cadastro_keywords.robot


*** Test Cases ***
Validar acesso à tela de pré-cadastro
    [Documentation]    Este teste valida se o botão de pré-cadastro redireciona corretamente.
    [Tags]    pre-cadastro
    Abrir tela de login
    Clicar no botão do menu    PRE_CADASTRO_BOTAO
    Verificar elemento de seleção de estado
    Fechar navegador

Validar seleção de estado no pré-cadastro
    [Documentation]    Este teste valida a seleção do estado "São Paulo" no pré-cadastro.
    [Tags]    pre-cadastro
    Abrir tela de login
    Clicar no botão do menu    PRE_CADASTRO_BOTAO
    Verificar elemento de seleção de estado
    Selecionar estado São Paulo
    Fechar navegador

Validar seleção de cidade no pré-cadastro
    [Documentation]    Este teste valida a seleção da cidade "Campinas" no pré-cadastro.
    [Tags]    pre-cadastro
    Abrir tela de login
    Clicar no botão do menu    PRE_CADASTRO_BOTAO
    Verificar elemento de seleção de estado
    Selecionar estado São Paulo
    Selecionar cidade Campinas
    Fechar navegador

Validar envio sem preencher obrigatórios
    [Documentation]    Este teste valida o envio do formulário sem preencher os campos obrigatórios.
    [Tags]    pre-cadastro
    Abrir tela de login
    Clicar no botão do menu    PRE_CADASTRO_BOTAO
    Verificar elemento de seleção de estado
    Selecionar estado São Paulo
    Selecionar cidade Campinas
    Validar envio sem preencher obrigatórios
    Fechar navegador

Validar envio com todos os campos preenchidos
    [Documentation]    Este teste valida o envio do formulário com todos os campos preenchidos.
    [Tags]    pre-cadastro
    Abrir tela de login
    Clicar no botão do menu    PRE_CADASTRO_BOTAO
    Verificar elemento de seleção de estado
    Selecionar estado São Paulo
    Selecionar cidade Campinas
    Preencher e enviar formulário
    Fechar navegador
