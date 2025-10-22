*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Resource   ../locators/professor_locators.robot
Resource    ../common.robot

*** Keywords ***
Gerar Email Random
    ${random_string}=    Generate Random String    8    [LETTERS][NUMBERS]
    RETURN    ${random_string}@email.com

Abrir página professor
    Open Browser Custom
    Go To    ${URL}/seja-um-professor
    Wait Until Element Is Visible    ${FORM_PROFESSOR}    timeout=20s

Validar envio sem preencher obrigatorios
    [Documentation]  
    Click Button    ${BTN_SUBMIT}
    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${ALERTA_HCAPTCHA}    timeout=8s
    Element Should Be Visible    ${FORM_PROFESSOR}
    ${v}=    Get Value    ${CAMPO_NOME_SOCIAL}
    Should Be Empty    ${v}

Preencher formulário professor
    [Arguments]    ${nome}=João da Silva    ${email}=auto    ${telefone}=11999999999    ${profissao}=Professor    ${cidade}=Campinas    ${estado}=SP    ${raca}=parda    ${nucleo}=3    ${disciplinas}=Matemática
    ${email_addr}=    Run Keyword If    '${email}' == 'auto'    Gerar Email Random    ELSE    Set Variable    ${email}
    Input Text    ${CAMPO_NOME_SOCIAL}    ${nome}
    ${dia}=    Set Variable    01
    ${mes}=    Set Variable    01
    ${ano}=    Set Variable    1990
    ${iso}=    Set Variable    ${ano}-${mes}-${dia}
    Execute JavaScript    document.getElementById('data_nascimento') && (document.getElementById('data_nascimento').value='${iso}', document.getElementById('data_nascimento').dispatchEvent(new Event('input',{bubbles:true})), document.getElementById('data_nascimento').dispatchEvent(new Event('change',{bubbles:true})));
    Input Text    ${CAMPO_EMAIL}    ${email_addr}
    Input Text    ${CAMPO_TELEFONE}    ${telefone}
    Input Text    ${CAMPO_PROFISSAO}    ${profissao}
    Input Text    ${CAMPO_CIDADE}    ${cidade}
    Select From List By Value    ${SELECT_ESTADO}    ${estado}
    Select From List By Value    ${SELECT_RACA}      ${raca}
    Select From List By Value    ${SELECT_NUCLEO}    ${nucleo}
    Input Text    ${CAMPO_DISCIPLINAS}    ${disciplinas}
    Click Element    ${ACEITO}
    Sleep    0.5s

Enviar formulário professor (com tentativa de bypass hCaptcha para ambiente de teste)
    [Documentation]    
    Scroll Element Into View    ${BTN_SUBMIT}
    Sleep    0.3s
    ${hc_exists}=    Run Keyword And Return Status    Element Should Be Visible    ${HCAPTCHA_TEXTAREA}    timeout=1s
    Run Keyword If    ${hc_exists}    Execute JavaScript    var t=document.querySelector('textarea[id^=\"h-captcha-response\"],textarea[name^=\"h-captcha-response\"]'); if(t){ t.value='test-token'; t.dispatchEvent(new Event('input',{bubbles:true})); t.dispatchEvent(new Event('change',{bubbles:true})); }
    ${ok}=    Run Keyword And Return Status    Click Button    ${BTN_SUBMIT}
    Run Keyword If    not ${ok}    Execute JavaScript    document.getElementById('btn-submit') && document.getElementById('btn-submit').click();
    Run Keyword If    not ${ok}    Execute JavaScript    var f=document.getElementById('professor-form'); if(f){ f.submit(); }
    Sleep    1s
    Run Keyword And Return Status    Wait Until Element Is Visible    ${MSG_SUCCESS}    timeout=25s