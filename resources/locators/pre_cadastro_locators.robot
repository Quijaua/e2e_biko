*** Variables ***
${PRE_CADASTRO_BOTAO}    //a[@href='https://biko.quijaua.com.br/inscricoes-para-cursinho-pre-vestibular-nucleo-yabas']
${SELECIONE_ESTADO}      //a[@id='step-1']
${BOTAO_SAO_PAULO}       //input[@value='São Paulo']
${RESULTADO_LOCAL}       //div[@id='resultadoLocal']
${RESULTADO_ESTADO}      //strong[@id='resultado']
${DROPDOWN_CIDADE}       //select[@id='inputNucleo']
${RESULTADO_CIDADE}      //div[@id='resultadoNucleo']
${TEXTO_CIDADE}          //strong[@id='nucleoSelecionadoTexto']
${FORMULARIO_PRE_CADASTRO}     //div[@id='formulario_de_precadastro']
${BOTAO_SUBMIT}          id=btnSubmit
${ERRO_NOME}             //div[contains(@class, 'invalid-feedback invalid-name')]
${ERRO_EMAIL}            //div[contains(@class, 'invalid-feedback invalid-email')]
${SUCESSO_MENSAGEM}      //div[contains(@class, 'success-message')]
${CAMPO_NOME}            id=name
${CAMPO_EMAIL}           id=email
${CAMPO_TELEFONE}        id=phone
${CAMPO_CEP}             id=inputCEP
${CAMPO_ENDERECO}        id=inputEndereco
${CAMPO_NUMERO}          id=inputNumero
${CAMPO_CIDADE}          id=inputCidade
${DROPDOWN_ESTADO}       id=inputEstado
${CAMPO_NASCIMENTO}      id=inputNascimento
${DROPDOWN_RACA}         id=raca
${MODAL_SUCESSO}         id=successModal
${TITULO_MODAL_SUCESSO}  id=successModalLabel
