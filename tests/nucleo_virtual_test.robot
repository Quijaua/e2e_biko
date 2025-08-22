*** Settings ***
Resource    ../resources/common.robot
Resource    ../resources/keywords/nucleo_virtual_keywords.robot
Resource    ../setup/setup_nucleo_virutal.robot

Test Setup    Abrir navegador
Test Teardown    Fechar navegador
Library    ../.venv/lib/site-packages/robot/libraries/OperatingSystem.py
    

*** Test Cases ***
Cenário: Verificar navegação para Núcleo Virtual
    [Tags]    nucleo_virtual
    Dado que estou na página inicial
    E o botão Núcleo Virtual está visível
    Quando clico no botão Núcleo Virtual
    Então deve abrir a página do Núcleo Virtual

Cenário: Cadastro de nova aula virtual Verifica campos obrigatórios
    [Tags]    adicionar_aula
    Dado que estou na página de cadastro de aula virtual
    Então os campos obrigatórios do cadastro de aula devem estar visíveis
    Quando tento enviar o formulário vazio
    Então o sistema não deve permitir o envio do formulário vazio

Cenário: Cadastro de aula virtual com dados válidos
    [Tags]    adicionar_aula
    Dado que estou na página de cadastro de aula virtual
    Quando preencho e envio o cadastro de aula válido    ${PROFESSOR}    ${DISCIPLINA}    ${IMAGEM}    ${VIDEO_LINK}
    Então a mensagem de sucesso de aula criada deve aparecer
    E o card da aula criada deve estar visível

Cenário: Editar aula criada
    [Tags]    editar_aula
    Dado que estou na página do Núcleo Virtual
    E o card da aula criada deve estar visível
    Quando edito a aula criada
    Então a mensagem de sucesso de aula editada deve aparecer


Cenário: Excluir aula criada
    [Tags]    excluir_aula
    Dado que estou na página do Núcleo Virtual
    E o card da aula criada deve estar visível
    Quando excluo a aula criada
    Então a mensagem de sucesso de aula excluída deve aparecer

Cenário: Testar filtros de aulas
    [Tags]    filtro_aulas
    Dado que estou na página do Núcleo Virtual
    Quando crio duas aulas para filtro
    Quando aplico filtro de Matemática
    Então só a aula de Matemática deve aparecer
    Quando limpo os filtros
    Então ambas as aulas devem aparecer
    Quando aplico filtro de Português
    Então só a aula de Português deve aparecer
    Quando limpo os filtros
    Então ambas as aulas devem aparecer

