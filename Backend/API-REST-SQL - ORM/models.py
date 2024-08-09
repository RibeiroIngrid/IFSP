from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Produto(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(80), unique=True, nullable=False)
    preco = db.Column(db.Float, nullable=False)
    categoria_id = db.Column(db.Integer, db.ForeignKey('categoria.id'))
    categoria = db.relationship('Categoria', backref=db.backref('produtos', lazy=True))

class Categoria(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(80), unique=True, nullable=False)

class Cliente(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
