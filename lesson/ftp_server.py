from pyftpdlib import servers
from pyftpdlib.authorizers import DummyAuthorizer
from pyftpdlib.handlers import FTPHandler


authorizer = DummyAuthorizer()
authorizer.add_user("user", "12345", "..\\files_for_test\\ftp", perm="elradfmw")
address = ("127.0.0.1", 21)  # listen on localhost only on port 21
handler = FTPHandler
print(authorizer.get_home_dir('user'))
handler.authorizer = authorizer
server = servers.FTPServer(address, handler)
server.serve_forever()
