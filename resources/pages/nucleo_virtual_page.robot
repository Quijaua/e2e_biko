*** Settings ***
Library   SeleniumLibrary
Library   OperatingSystem
Resource    ../locators/nucleo_virtual_locators.robot
Resource    ../../setup/setup_variables.robot
Resource    ../../setup/setup_nucleo_virutal.robot

*** Keywords ***
 Verificar se o título está presente
    Wait Until Element Is Visible    ${NUCLEO_VIRTUAL_TITLE}    timeout=60s
    Element Should Be Visible    ${NUCLEO_VIRTUAL_TITLE}

 Verificar se está na página de cadastro de aula virtual
    Wait Until Element Is Visible    ${ADD_CLASS_TITLE}    timeout=60s
    Element Should Be Visible    ${ADD_CLASS_FORM}

 Verificar campos obrigatórios do cadastro de aula
    Element Should Be Visible    ${ADD_CLASS_TITULO_INPUT}
    Element Should Be Visible    ${ADD_CLASS_IMAGEM_INPUT}
    Element Should Be Visible    ${ADD_CLASS_DURACAO_INPUT}
    Element Should Be Visible    ${ADD_CLASS_VIDEO_INPUT}
    Element Should Be Visible    ${ADD_CLASS_PROFESSOR_SELECT}
    Element Should Be Visible    ${ADD_CLASS_DISCIPLINA_SELECT}
    Element Should Be Visible    ${ADD_CLASS_SUBMIT_BTN}

 Tentar enviar formulário vazio
    Clicar no botão Salvar do cadastro de aula
    Location Should Be    ${URL}/ambiente-virtual/create

 Preencher e enviar cadastro de aula válido
    [Arguments]    ${professor}    ${disciplina}    ${imagem}    ${video_link}
    Preencher dados da aula    ${professor}    ${disciplina}    ${imagem}    ${video_link}    Aula Teste

Clicar no botão "Adicionar nova aula"
    Wait Until Element Is Visible    ${ADICIONAR_NOVA_AULA_BTN}    timeout=60s
    Scroll Element Into View    ${ADICIONAR_NOVA_AULA_BTN}
    Click Element    ${ADICIONAR_NOVA_AULA_BTN}

Clicar no botão Salvar do cadastro de aula
    Wait Until Element Is Visible    ${ADD_CLASS_SUBMIT_BTN}    timeout=60s
    Wait Until Element Is Enabled    ${ADD_CLASS_SUBMIT_BTN}    timeout=60s
    Scroll Element Into View         ${ADD_CLASS_SUBMIT_BTN}
    Click Element                    ${ADD_CLASS_SUBMIT_BTN}

Verificar mensagem de sucesso de aula criada
   Wait Until Element Is Visible    //div[contains(@class, 'alert-success') and contains(., 'Aula virtual criada com sucesso!')]    timeout=60s
   Element Should Be Visible        //div[contains(@class, 'alert-success') and contains(., 'Aula virtual criada com sucesso!')]

Verificar card da aula criada
   ${card_xpath}=    Set Variable    //h3[contains(@class, 'card-title') and contains(., 'Aula Teste')]
   Scroll Element Into View         ${card_xpath}
   Wait Until Element Is Visible    ${card_xpath}    timeout=60s
   Element Should Be Visible        ${card_xpath}

Clicar no botão excluir da aula criada
   ${card_header_xpath}=    Set Variable    //h3[contains(@class, 'card-title') and contains(., 'Aula Teste')]/ancestor::div[contains(@class, 'card')]/div[contains(@class, 'card-header')][2]
   ${excluir_btn_xpath}=    Set Variable    ${card_header_xpath}//button[contains(@class, 'btn-danger')]
   Scroll Element Into View         ${excluir_btn_xpath}
   Wait Until Element Is Visible    ${excluir_btn_xpath}    timeout=60s
   Click Element                    ${excluir_btn_xpath}

Verificar mensagem de sucesso de aula excluída
   Wait Until Element Is Visible    //div[contains(@class, 'alert-success') and contains(., 'Aula virtual excluida com sucesso!')]    timeout=60s
   Element Should Be Visible        //div[contains(@class, 'alert-success') and contains(., 'Aula virtual excluida com sucesso!')]

Editar aula criada
   ${card_header_xpath}=    Set Variable    //h3[contains(@class, 'card-title') and contains(., 'Aula Teste')]/ancestor::div[contains(@class, 'card')]/div[contains(@class, 'card-header')][2]
   ${editar_btn_xpath}=    Set Variable    ${card_header_xpath}//a[contains(@href, '/edit')]
   Scroll Element Into View         ${editar_btn_xpath}
   Wait Until Element Is Visible    ${editar_btn_xpath}    timeout=60s
   Click Element                    ${editar_btn_xpath}
   Wait Until Element Is Visible    ${ADD_CLASS_FORM}    timeout=60s
   Preencher dados da aula    ${PROFESSOR_UPDATE}    ${DISCIPLINA_UPDATE}    ${IMAGEM_UPDATE}    ${VIDEO_LINK_UPDATE}    Aula Teste update
   Click Element    ${ADD_CLASS_SUBMIT_BTN}

Verificar mensagem de sucesso de aula editada
   Wait Until Element Is Visible    //div[contains(@class, 'alert-success') and contains(., 'Aula virtual atualizada com sucesso!')]    timeout=60s
   Element Should Be Visible        //div[contains(@class, 'alert-success') and contains(., 'Aula virtual atualizada com sucesso!')]

Criar aula para filtro
   [Arguments]    ${disciplina}    ${professor}    ${titulo}    ${imagem}   ${video_link}
   Clicar no botão "Adicionar nova aula"
   Preencher dados da aula    ${professor}    ${disciplina}    ${imagem}    ${video_link}    ${titulo}
   Click Element    ${ADD_CLASS_SUBMIT_BTN}
   Wait Until Element Is Visible    //div[contains(@class, 'alert-success') and contains(., 'Aula virtual criada com sucesso!')]    timeout=60s

Clicar no filtro de área
   [Arguments]    ${area_label}
   ${filtro_xpath}=    Set Variable    //span[contains(@class, 'form-selectgroup-label') and contains(., '${area_label}')]
   Scroll Element Into View         ${filtro_xpath}
   Wait Until Element Is Visible    ${filtro_xpath}    timeout=60s
   Click Element                    ${filtro_xpath}

Clicar no botão Limpar filtros
   Scroll Element Into View         ${LIMPAR_FILTROS_BTN}
   Wait Until Element Is Visible    ${LIMPAR_FILTROS_BTN}    timeout=60s
   Click Element                    ${LIMPAR_FILTROS_BTN}

Verificar aula visível por título
   [Arguments]    ${titulo}
   ${card_xpath}=    Set Variable    //h3[contains(@class, 'card-title') and contains(., '${titulo}')]
   Wait Until Element Is Visible    ${card_xpath}    timeout=60s
   Element Should Be Visible        ${card_xpath}

Verificar aula não visível por título
   [Arguments]    ${titulo}
   ${card_xpath}=    Set Variable    //h3[contains(@class, 'card-title') and contains(., '${titulo}')]
   Element Should Not Be Visible    ${card_xpath}

Preencher dados da aula
   [Arguments]    ${professor}    ${disciplina}    ${imagem}    ${video_link}    ${titulo}
   Input Text    ${ADD_CLASS_TITULO_INPUT}    ${titulo}
   Fill Image Field    ${imagem}
   Input Text    ${ADD_CLASS_DURACAO_INPUT}    01:00:00
   Input Text    ${ADD_CLASS_VIDEO_INPUT}    ${video_link}
   Select From List By Label    ${ADD_CLASS_PROFESSOR_SELECT}    ${professor}
   Select From List By Label    ${ADD_CLASS_DISCIPLINA_SELECT}   ${disciplina}

Fill Image Field
   [Arguments]    ${imagem}
   ${normalized_path}=    Normalize Path    ${imagem}
   Choose File    ${ADD_CLASS_IMAGEM_INPUT}    ${normalized_path}
   