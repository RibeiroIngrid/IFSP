import http.server
import socketserver
import json

PORT = 8000

class MyRequestHandler(http.server.BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/produtos':
            produtos = [
                {'id': 1, 'nome': 'Produto A', 'preco': 10.0},
                {'id': 2, 'nome': 'Produto B', 'preco': 20.0},
                {'id': 3, 'nome': 'Produto C', 'preco': 15.0}
            ]
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
        print(data)  # Log dos dados recebidos
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b'Dados recebidos com sucesso')

with socketserver.TCPServer(("", PORT), MyRequestHandler) as httpd:
    print("servidor rodando na porta", PORT)
    httpd.serve_forever()
