# e2eBiko - Automação de Testes E2E com Robot Framework

## Pré-requisitos

- Python 3.8+
- Google Chrome instalado
- pip (gerenciador de pacotes Python)

## Instalação

1. **Clone o repositório:**

   ```bash
   git clone https://github.com/Quijaua/e2e_biko
   cd e2e_biko
   ```

2. **Crie e ative um ambiente virtual (opcional, recomendado):**

   ```bash
   python3 -m venv .venv
   source .venv/bin/activate
   ```

3. **Instale as dependências:**

   ```bash
   pip install -r requirements.txt
   ```

4. **Instale o driver do navegador:**

   - Para Chrome: [Baixe o ChromeDriver](https://chromedriver.chromium.org/downloads) compatível com sua versão do Chromium.

5. **Configuração de variáveis:**

Antes de rodar os testes, copie o arquivo `setup/setup_variables.exemplo.robot` para `setup/setup_variables.robot` e edite as credenciais de login conforme seu ambiente:

````robotframework
*** Variables ***
${URL}     http://SEU_SERVIDOR:8000/
${LOGIN_EMAIL}     seu_email@dominio.com
${LOGIN_PASSWORD}  sua_senha
```s

## Como executar os testes

```bash
robot -d results tests
````

- Os relatórios serão gerados na pasta `results`.

## Estrutura do projeto

- `resources/` - Keywords, locators e páginas
- `setup/` - Variáveis globais
- `tests/` - Casos de teste
- `results/` - Relatórios e evidências

## Dicas

- Para rodar um teste específico:
  ```bash
  robot -d results tests/nucleo_virtual_test.robot
  ```
- Para rodar apenas cenários com uma tag:
  ```bash
  robot -d results -i adicionar_aula tests
  ```
