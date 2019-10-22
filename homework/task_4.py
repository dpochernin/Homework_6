import smtplib
import ssl

SERVER = 'smtp.gmail.com'
PORT = 465
user = 'sitestgmai@gmail.com'
paswd = ''

sender = 'sitestgmai@gmail.com'
receiver = 'el.piankova@gmail.com'
message = """\
Test email from d.pochernin
using test account"""

context = ssl.create_default_context()

with smtplib.SMTP_SSL(SERVER, PORT, context=context) as server:
    server.login(user, paswd)
    server.sendmail(sender, receiver, message)
# почемуто получателя пихает в ВСС а не в ТО

