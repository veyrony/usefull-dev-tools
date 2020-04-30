#!/usr/bin/env python3

# this is for https server, if http use :
#   $ python -m SimpleHTTPServer [PORT]
#
# To generate a certificate use mkcert
# refer to: https://github.com/FiloSottile/mkcert
# step 1 :$ mkcert localhost 127.0.0.1
# setp 2 :$ mkcert -install

from http.server import HTTPServer, SimpleHTTPRequestHandler
import ssl

separator = "-" * 80

port = 443
httpd = HTTPServer(("localhost", port), SimpleHTTPRequestHandler)
httpd.socket = ssl.wrap_socket(httpd.socket,
                               keyfile="./localhost+1-key.pem",
                               certfile="./localhost+1.pem",
                               server_side=True)

print(separator)
print("HTTTPS Server running on https://localhost:%s" % port)
print(separator)

httpd.serve_forever()
