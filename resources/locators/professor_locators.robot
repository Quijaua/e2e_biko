*** Variables ***
${FORM_PROFESSOR}        id=professor-form
${CAMPO_NOME_SOCIAL}     id=nome_social
${CAMPO_DATA_NASC}       id=data_nascimento
${CAMPO_EMAIL}           id=email
${CAMPO_TELEFONE}        id=telefone
${CAMPO_PROFISSAO}       id=profissao
${CAMPO_CIDADE}          id=cidade_professor
${SELECT_ESTADO}         id=estado
${SELECT_RACA}           id=raca_cor
${SELECT_GENERO}         id=genero
${SELECT_NUCLEO}         id=nucleo_id
${CAMPO_DISCIPLINAS}     id=disciplinas
${ACEITO}                id=aceito
${HCAPTCHA_TEXTAREA}     xpath=//textarea[contains(@id,'h-captcha-response') or contains(@name,'h-captcha-response')]
${BTN_SUBMIT}            id=btn-submit
${ALERTA_HCAPTCHA}       xpath=//div[contains(@class,'alert') and (contains(.,'hCaptcha') or contains(.,'Por favor complete'))]
${MSG_SUCCESS}           xpath=//div[contains(normalize-space(.),'Agradecemos o interesse em se tornar um professor') or contains(.,'Agradecemos')]