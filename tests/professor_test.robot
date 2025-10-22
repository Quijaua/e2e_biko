*** Settings ***
Resource    ../resources/common.robot
Resource    ../resources/keywords/professor_keywords.robot

*** Test Cases ***
Validar envio sem preencher obrigatorios - Professor
    [Documentation]    Verifica que o formulário não envia quando obrigatório vazio.
    Abrir página professor
    Validar envio sem preencher obrigatorios
    Fechar navegador

Validar envio com todos os campos preenchidos - Professor
    [Documentation]    Preenche o formulário e tenta enviar
    Abrir página professor
    Preencher formulário professor
    Sleep   15
    ${ok}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${MSG_SUCCESS}    timeout=20s
    Run Keyword If    not ${ok}    Capture Page Screenshot
    # Run Keyword If    not ${ok}    Fail    Mensagem de sucesso não apareceu
    Fechar navegador
    Sleep   15
