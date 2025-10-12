*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Resource   ../locators/pre_cadastro_locators.robot

*** Keywords ***
Gerar Email Random
    ${random_string}=    Generate Random String    8    [LETTERS][NUMBERS]
    RETURN    ${random_string}@email.com

Verificar elemento de seleção de estado
    [Documentation]    Verifica se o elemento "Selecione seu Estado" está visível na tela.
    Element Should Be Visible    ${SELECIONE_ESTADO}
    ${texto}    Get Text    ${SELECIONE_ESTADO}
    Should Contain    ${texto}    Selecione seu Estado

Selecionar estado São Paulo
    [Documentation]    Clica no botão "São Paulo" e verifica os elementos exibidos.
    Click Button    ${BOTAO_SAO_PAULO}
    Wait Until Element Is Visible    ${RESULTADO_LOCAL}    timeout=30s
    Element Should Be Visible    ${RESULTADO_LOCAL}
    Element Text Should Be    ${RESULTADO_ESTADO}    São Paulo
    Wait Until Element Is Visible    ${DROPDOWN_CIDADE}    timeout=30s
    Element Should Be Visible    ${DROPDOWN_CIDADE}

Selecionar cidade Campinas
    [Documentation]    Seleciona a cidade "Campinas" no dropdown e verifica os elementos exibidos.
    Select From List By Label    ${DROPDOWN_CIDADE}    - Campinas -
    Wait Until Element Is Visible    ${RESULTADO_CIDADE}    timeout=30s
    Element Should Be Visible    ${RESULTADO_CIDADE}
    Element Text Should Be    ${TEXTO_CIDADE}    - Campinas -
    Wait Until Element Is Visible    ${FORMULARIO_PRE_CADASTRO}    timeout=30s
    Element Should Be Visible    ${FORMULARIO_PRE_CADASTRO}
    Element Attribute Value Should Be    ${FORMULARIO_PRE_CADASTRO}    class    tab-pane active show

Validar envio sem preencher obrigatórios
    [Documentation]    Clica no botão de envio sem preencher os campos obrigatórios e verifica os erros.
    Click Button    ${BOTAO_SUBMIT}
    Wait Until Element Is Visible    ${ERRO_NOME}    timeout=10s
    Element Should Be Visible    ${ERRO_NOME}
    Element Should Be Visible    ${ERRO_EMAIL}

Preencher e enviar formulário
    [Documentation]    Preenche todos os campos obrigatórios e envia o formulário.
    ${random_email}=    Gerar Email Random
    Input Text    ${CAMPO_NOME}    João da Silva
    Input Text    ${CAMPO_EMAIL}    ${random_email}
    Press Keys    ${CAMPO_TELEFONE}    11912345678
    Press Keys    ${CAMPO_CEP}    13010002
    Sleep    3s
    Input Text    ${CAMPO_NUMERO}    123
    Wait Until Element Is Visible    ${CAMPO_NASCIMENTO}    timeout=10s

    Click Element    ${CAMPO_NASCIMENTO}
    ${DATA}=    Set Variable    01/01/1990
    ${day}    ${month}    ${year}=    Split String    ${DATA}    /
    ${iso}=    Set Variable    ${year}-${month}-${day}
    Execute JavaScript    document.getElementById('inputNascimento').value = '${iso}'; document.getElementById('inputNascimento').dispatchEvent(new Event('input',{bubbles:true})); document.getElementById('inputNascimento').dispatchEvent(new Event('change',{bubbles:true})); document.getElementById('inputNascimento').blur();
    Click Element    xpath=//body
    Sleep    1s

    Select From List By Label    ${DROPDOWN_RACA}    Parda
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    1s
    Wait Until Element Is Visible    ${BOTAO_SUBMIT}    timeout=10s
    Wait Until Element Is Enabled    ${BOTAO_SUBMIT}    timeout=10s
    Click Button    ${BOTAO_SUBMIT}
    Wait Until Element Is Visible    ${MODAL_SUCESSO}    timeout=30s
    Wait Until Element Contains    ${TITULO_MODAL_SUCESSO}    👏 Cadastro efetuado com sucesso    timeout=10s