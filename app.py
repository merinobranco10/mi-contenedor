from http.server import BaseHTTPRequestHandler, HTTPServer

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-Type", "text/plain; charset=utf-8")
        self.end_headers()
        self.wfile.write(b"Contenedor funcionando correctamente!\n")

server = HTTPServer(("0.0.0.0", 8080), Handler)
print("Servidor iniciado en el puerto 8080")
server.serve_forever()
