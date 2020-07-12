#!/usr/bin/env python3

import http.server as server
import socketserver

# Эта переменная нужна для обработки запросов клиента к серверу.
handler = server.SimpleHTTPRequestHandler

# Тут мы указываем, что сервер мы хотим запустить на порте 1234. 
# Постарайтесь запомнить эти сведения, так как они нам очень пригодятся в дальнейшем, при работе с docker-compose.
with socketserver.TCPServer(("", 1234), handler) as httpd:
    # Благодаря этой команде сервер будет выполняться постоянно, ожидая запросов от клиента.
    print("Start server at 1234 port")

    httpd.serve_forever()