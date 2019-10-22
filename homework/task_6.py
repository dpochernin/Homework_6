import email
import imaplib
import ssl
import datetime
from os import remove, mkdir

SERVER = 'imap.gmail.com'
PORT = 993
user = 'sitestgmai@gmail.com'
paswd = ''

context = ssl.create_default_context()

with imaplib.IMAP4_SSL(host=SERVER, port=PORT, ssl_context=context) as imap:
    print(imap.login(user=user, password=paswd))
    imap.select('INBOX')
    mail_ids = imap.search(None, 'FROM si.test2017@yandex.ru')[1]
    mail_ids = mail_ids[0].split()
    try:
        mkdir('..\\msg')
    except FileExistsError:
        pass
    for mail_id in mail_ids:
        data = imap.fetch(mail_id, '(RFC822)')[1]
        body = data[0]
        msg = email.message_from_bytes(body[1])
        email_from = msg['from'].split()[1][1:-1]
        email_date = datetime.datetime.strptime(msg['date'], '%a, %d %b %Y %H:%M:%S %z')
        f_name = (f'{email_date.day}.{email_date.month}.{email_date.year}_'
                  f'{email_date.hour}.{email_date.minute}_{email_from}.msg')

        try:
            remove(f'..\\msg\\{email_from}\\{f_name}')
        except (FileNotFoundError, FileExistsError):
            pass
        try:
            mkdir(f'..\\msg\\{email_from}')
        except FileExistsError:
            pass

        with open(f'..\\msg\\{email_from}\\{f_name}', 'x') as msg_file:
            print(msg, file=msg_file)
