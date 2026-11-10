# Testes mobile da Yodapp

Este repositório reúne o servidor Appium e os testes automatizados da aplicação Android Yodapp, escritos com Robot Framework e AppiumLibrary.

## Estrutura

```text
.
├── appium-server/           # Dependências do servidor Appium
└── yodapp-robot/
    ├── app/
    │   └── yodapp-beta.apk  # Aplicativo usado pelo teste
    ├── tests/
    │   └── home.robot      # Teste da tela inicial
    └── logs/                # Relatórios gerados (não versionados)
```

## Pré-requisitos

- Node.js e npm
- Python 3 e pip
- Java JDK e Android SDK, incluindo o `adb`
- Emulador Android em execução ou dispositivo conectado

## Preparar o ambiente

### Servidor Appium

Em um terminal, instale as dependências do servidor:

```bash
cd appium-server
npm ci
```

Confira se o driver UiAutomator2 está instalado:

```bash
npx appium driver list --installed
```

Se não estiver listado, instale-o:

```bash
npx appium driver install uiautomator2
```

### Testes Robot Framework

Em outro terminal, crie e ative um ambiente virtual Python:

```bash
cd yodapp-robot
python3 -m venv .venv
source .venv/bin/activate
```

No Windows, ative o ambiente com:

```powershell
.venv\Scripts\Activate.ps1
```

Instale o Robot Framework e a biblioteca Appium:

```bash
python -m pip install robotframework robotframework-appiumlibrary
```

## Executar o teste

1. Inicie o emulador ou conecte o dispositivo. O teste espera encontrar o dispositivo `emulator-5554`; confirme com `adb devices`.
2. No terminal do servidor, inicie o Appium:

   ```bash
   cd appium-server
   npx appium
   ```

3. No terminal com o ambiente Python ativado, execute o teste:

   ```bash
   cd yodapp-robot
   robot -d logs tests/
   ```

O teste em `tests/home.robot` abre o APK `app/yodapp-beta.apk` via Appium, verifica se o texto `Yodapp` aparece na tela e fecha a aplicação. O servidor deve estar acessível em `http://localhost:4723`.

## Relatórios

Os resultados da execução são gravados em `yodapp-robot/logs/`, incluindo `log.html`, `report.html` e `output.xml`. Essa pasta e `appium-server/node_modules/` são ignoradas pelo `.gitignore`.

## Observações

- O APK está versionado em `yodapp-robot/app/yodapp-beta.apk`; mantenha esse caminho ou atualize a configuração em `tests/home.robot`.
- Se o dispositivo tiver outro identificador, ajuste o valor de `udid` no teste.
- Os comandos `npm test` dos `package.json` ainda são apenas placeholders; use os comandos acima para instalar e executar o projeto.
