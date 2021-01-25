# GitHub-Search
Integração com o endpoint de busca de repositórios da API do GitHub

## Configuração

Requisitos:
- Ruby 3.0.0 ou;
- Docker & docker-compose instalados

### Variáveis de Ambiente
- Criar um arquivo `.env` na raiz do projeto contendo:

```
GITHUB_API_USERNAME=your_username_goes_here
GITHUB_API_TOKEN=your_token_goes_here
# Endereço das chamadas do Swagger
HOST_ADDRESS=http://localhost:3000
```

#### Variáveis adicionais quando utilizado docker-compose
```
COMPOSE_PROJECT_NAME=app
RAILS_ENV=development
RAILS_PORT=3000
RAILS_BIND=0.0.0.0
```

Para maiores informações sobre como gerar um token para sua API:

- [GitHub: Criando token de acesso pessoal](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token)

### Rodando a aplicação

- Instalar dependências
```ruby
bundle install
```

- Executar o web server
```
rails s
```

### Rodando via Docker

Alternativamente, você pode rodar a aplicaçào com base nos `Dockerfile` e `docker-compose.yml` fornecidos.

- Iniciar o container
```bash
docker-compose up
```

## Documentação

- A documentação da API encontra-se disponível na rota `/api-docs`
