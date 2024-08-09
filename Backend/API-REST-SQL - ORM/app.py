from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy
from models import db, Produto, Categoria, Cliente

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://usuario:senha@host/banco_de_dados'
db.init_app(app)

with app.app_context():
    db.create_all()

# ... Rotas da API

@app.route('/produtos')
def get_produtos():
    produtos = Produto.query.all()
    return jsonify([produto.to_json() for produto in produtos])

# ... Outras rotas para as demais operações CRUD e para as outras tabelas

# Método para serializar os objetos para JSON
def to_json(self):
    return {'id': self.id, 'nome': self.nome, 'preco': self.preco, 'categoria': self.categoria.nome}
Produto.to_json = to_json
