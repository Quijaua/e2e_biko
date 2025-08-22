*** Settings ***
Resource    ../pages/side_menu_page.robot
Resource    ../pages/nucleo_virtual_page.robot
Resource    ../locators/nucleo_virtual_locators.robot
Resource    ../../setup/setup_nucleo_virutal.robot

*** Keywords ***
Dado que estou na página inicial
    No Operation
E o botão Núcleo Virtual está visível
    Verificar se o botão do menu está visível    NUCLEO_VIRTUAL_LINK
Quando clico no botão Núcleo Virtual
    Clicar no botão do menu    NUCLEO_VIRTUAL_LINK
Então deve abrir a página do Núcleo Virtual
    Verificar se o título está presente

Dado que estou na página de cadastro de aula virtual
    Verificar se o botão do menu está visível    NUCLEO_VIRTUAL_LINK
    Clicar no botão do menu    NUCLEO_VIRTUAL_LINK
    Clicar no botão "Adicionar nova aula"
    Verificar se está na página de cadastro de aula virtual

Então os campos obrigatórios do cadastro de aula devem estar visíveis
    Verificar campos obrigatórios do cadastro de aula

Quando tento enviar o formulário vazio
    Tentar enviar formulário vazio

Então o sistema não deve permitir o envio do formulário vazio
    Location Should Be    http://100.101.47.64:8000/ambiente-virtual/create

Quando preencho e envio o cadastro de aula válido
    [Arguments]    ${professor}    ${disciplina}    ${imagem}    ${video_link}
    Preencher e enviar cadastro de aula válido    ${professor}    ${disciplina}    ${imagem}    ${video_link}
    Clicar no botão Salvar do cadastro de aula

Então a mensagem de sucesso de aula criada deve aparecer
    Verificar mensagem de sucesso de aula criada

E o card da aula criada deve estar visível
    Verificar card da aula criada

Dado que estou na página do Núcleo Virtual
    Verificar se o botão do menu está visível    NUCLEO_VIRTUAL_LINK
    Clicar no botão do menu    NUCLEO_VIRTUAL_LINK
    Verificar se o título está presente

Quando excluo a aula criada
    Clicar no botão excluir da aula criada

Então a mensagem de sucesso de aula excluída deve aparecer
    Verificar mensagem de sucesso de aula excluída

Quando edito a aula criada
    Editar aula criada

Então a mensagem de sucesso de aula editada deve aparecer
    Verificar mensagem de sucesso de aula editada

Quando crio duas aulas para filtro
    Criar aula para filtro    Matemática    Professor A    Aula Teste Matematica    ${IMAGEM}    ${VIDEO_LINK}
    Criar aula para filtro    Português     Professor B    Aula Teste Portugues    ${IMAGEM}    ${VIDEO_LINK}

Quando aplico filtro de Matemática
    Clicar no filtro de área    Matemática e suas Tecnologias

Quando aplico filtro de Português
    Clicar no filtro de área    Linguagens e suas Tecnologias

Quando limpo os filtros
    Clicar no botão Limpar filtros

Então só a aula de Matemática deve aparecer
    Verificar aula visível por título    Aula Teste Matematica
    Verificar aula não visível por título    Aula Teste Portugues

Então só a aula de Português deve aparecer
    Verificar aula visível por título    Aula Teste Portugues
    Verificar aula não visível por título    Aula Teste Matematica

Então ambas as aulas devem aparecer
    Verificar aula visível por título    Aula Teste Matematica
    Verificar aula visível por título    Aula Teste Portugues
