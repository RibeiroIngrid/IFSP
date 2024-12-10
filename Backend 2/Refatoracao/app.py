from flask import Flask, jsonify, request
from pymongo import MongoClient

app = Flask(__name__)

# Conectando ao MongoDB
client = MongoClient("mongodb://localhost:27017/")
db = client["minha_loja"]

# Coleções
produtos_collection = db["produtos"]
clientes_collection = db["clientes"]
pedidos_collection = db["pedidos"]

# Dados iniciais (5 documentos por coleção)
produtos = [
    {"nome": "Smartphone", "preco": 1500, "categoria": "Eletrônicos", "descricao": "Smartphone de última geração"},
    {"nome": "Notebook", "preco": 6500, "categoria": "Eletrônicos", "descricao": "Notebook de última geração"},
    {"nome": "Table", "preco": 2500, "categoria": "Eletrônicos", "descricao": "Tablet de última geração"},
    {"nome": "ipod", "preco": 500, "categoria": "Eletrônicos", "descricao": "ipod de última geração"},
    {"nome": "Mouse", "preco": 100, "categoria": "Eletrônicos", "descricao": "Mouse de última geração"},
]
produtos_collection.insert_many(produtos)

clientes = [
    {"nome": "Gabriel Americo", "email": "gabriel@email.com", "endereco": "Rua A, 123"},
    {"nome": "Tathianny Rafaeli", "email": "tathianny@email.com", "endereco": "Rua B, 122"},
    {"nome": "Ingrid Ribeiro", "email": "ingrid@email.com", "endereco": "Rua C, 133"},
    {"nome": "Camila Oliveira", "email": "camila@email.com", "endereco": "Rua D, 144"},
    {"nome": "Oaní Costa", "email": "oani@email.com", "endereco": "Rua E, 155"},
]
clientes_collection.insert_many(clientes)

pedidos = [
    {"cliente_id": 1, "produtos": [1, 2], "data": "2023-11-22"},
    {"cliente_id": 2, "produtos": [1, 3], "data": "2023-11-22"},
    {"cliente_id": 3, "produtos": [4, 2], "data": "2023-11-22"},
    {"cliente_id": 4, "produtos": [5, 2], "data": "2023-11-22"},
    {"cliente_id": 5, "produtos": [2], "data": "2023-11-22"},
        
]
pedidos_collection.insert_many(pedidos)

# Rotas da API

@app.route('/produtos')
def get_produtos():
    produtos = list(produtos_collection.find())
    return jsonify(produtos)

@app.route('/clientes')
def get_clientes():
    produtos = list(clientes_collection.find())
    return jsonify(clientes)

@app.route('/pedidos')
def get_produtos():
    produtos = list(pedidos_collection.find())
    return jsonify(pedidos)

if __name__ == '__main__':
    app.run(debug=True)
