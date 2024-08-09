import http.server
import socketserver
import json
import mysql.connector

# Configurações do banco de dados (substitua pelos seus dados)
mydb = mysql.connector.connect(
  host="seu_host",
  user="seu_usuario",
  password="sua_senha",
  database="seu_banco_de_dados"
)
mycursor = mydb.cursor()

# Função auxiliar para executar consultas SQL
def executar_consulta(query):
  mycursor.execute(query)
  return mycursor.fetchall()

class MyRequestHandler(http.server.BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/produtos':
            # Consulta todos os produtos
            mycursor.execute("SELECT * FROM produtos")
            produtos = mycursor.fetchall()
            self.send_response(200)
            self.send_header('Content-type', 'application/json')
            self.end_headers()
            self.wfile.write(bytes(json.dumps(produtos), 'utf-8'))
        else:
            self.send_error(404)

    def do_POST(self):
        content_length = int(self.headers['Content-Length'])
        post_data = self.rfile.read(content_length) 

        data = json.loads(post_data)
        print(data)
  # Log dos dados recebidos
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b'Dados recebidos com sucesso')

with socketserver.TCPServer(("", PORT), MyRequestHandler) as httpd:
    print("servidor rodando na porta", PORT)
    httpd.serve_forever()
