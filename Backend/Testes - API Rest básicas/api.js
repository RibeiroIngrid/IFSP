const express = require('express');
const app = express();
const port = 3000;

// Parse JSON bodies
app.use(express.json());

// Dados
const produtos = [
  { id: 1, nome: 'Produto A', preco: 10.0, categoria: 'Eletrônicos', estoque: 5 },
  { id: 2, nome: 'Produto B', preco: 20.0, categoria: 'Vestuário', estoque: 10 },
  { id: 3, nome: 'Produto C', preco: 15.0, categoria: 'Alimentos', estoque: 20 }
];

// Rota para obter todos os produtos
app.get('/produtos', (req, res) => {
  res.json(produtos);
});

// Rota para receber dados via POST
app.post('/dados', (req, res) => {
  console.log(req.body);
  res.send('Dados recebidos com sucesso');
});

app.listen(port, () => {
  console.log(`Servidor rodando na porta ${port}`);
});
