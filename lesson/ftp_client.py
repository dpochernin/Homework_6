from ftplib import FTP

with FTP(host='127.0.0.1', user='user', passwd='12345') as ftp:
    print(ftp.retrlines('LIST'))
    out = '..\\files_for_test\\index.png'
    with open(out, 'wb') as f:
        ftp.retrbinary('RETR index.png', f.write)

    path = '..\\files_for_test\\firm.txt'
    with open(path, 'rb') as file_2:
        print(file_2.name)
        ftp.storbinary('STOR firm.txt', file_2, 1024)
    print(ftp.retrlines('LIST'))

