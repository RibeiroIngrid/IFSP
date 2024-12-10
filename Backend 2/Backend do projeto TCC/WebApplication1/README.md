# TCC WebApp gerenciamento passeios e excursões

## Descrição

Essa é uma aplicação web .NET 8 que fornece uma API simples para gerenciamento de usuários. Inclui endpoints para criar, recuperar, atualizar e deletar usuários, bem como fazer login de usuários e recuperar usuários logados.

## Stack

- **Framework**: .NET 8
- **Language**: C# 12.0
- **API Documentation**: Swagger (Swashbuckle.AspNetCore 6.6.2)
- **Logging**: Microsoft.Extensions.Logging

## Pré Requisitos

- [.NET 8 SDK](https://dotnet.microsoft.com/download/dotnet/8.0)
- [Visual Studio 2022](https://visualstudio.microsoft.com/vs/)

## Instalação

1. **Clone o repositório**:
    
git clone https://github.com/seuusuario/WebApplication1.git
cd WebApplication1

2. **Restaure as dependências**:
    
dotnet restore

3. **Compile o projeto**:
    
dotnet build

## Uso

1. **Execute a aplicação**:
    
dotnet run

2. **Acesse a API**:
    - A API estará disponível em `https://localhost:5001` (ou `http://localhost:5000` para não-HTTPS).
    - A documentação e testes da API via Swagger estarão disponíveis em `https://localhost:5001/swagger` (ou `http://localhost:5000/swagger`).

## Endpoints da API

- **GET /SignUp/GetAllUsers**: Recuperar todos os usuários.
- **GET /SignUp/GetUserById/{id}**: Recuperar um usuário pelo ID.
- **GET /SignUp/GetUserByName/{name}**: Recuperar um usuário pelo nome.
- **POST /SignUp/CreateUser**: Criar um novo usuário.
- **DELETE /SignUp/DeleteUserById/{id}**: Deletar um usuário pelo ID.
- **POST /SignUp/login/{userId}**: Fazer login de um usuário.
- **GET /SignUp/GetAllLoggedInUsers**: Recuperar todos os usuários logados.
