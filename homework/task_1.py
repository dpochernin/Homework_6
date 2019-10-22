import http.client
import json

import requests


def library_changer(url: str, book: dict, book2: dict):
    respons = requests.post(url=url, data=book)
    book_id = respons.json()['id']
    assert 201 == respons.status_code
    print(f'Book created by URL {url}{book_id}')
    assert 200 == requests.get(url=f'{url}{book_id}').status_code
    print(f'Book by URL {url}{book_id} exist')
    assert 200 == requests.put(url=f'{url}{book_id}', data=book2).status_code
    remote_book = requests.get(url=f'{url}{book_id}').json()
    if (book2["title"] == remote_book["title"] and
            book2["author"] == remote_book["author"]):
        print(f'Book by ID {book_id} successfully updated')
    else:
        raise requests.exceptions.HTTPError(f'Book by URL {url}{book_id}, {remote_book} not updated to {book2}')
    print(requests.delete(f'{url}{book_id}').status_code)


def library_changer_http(url: str, book: dict, book2: dict):  # попробовал http.client - не понравилось (
    url = url.split(sep='/')                                  # если делать все запросы в одном коннекте - получаем сбои
    while True:
        try: url.remove('')
        except ValueError: break
    url[0] = url[0] + '/'

    with http.client.HTTPConnection(url[1]) as con:
        con.request('POST', f'/{url[2]}/', body=json.dumps(book), headers={'Content-Type': 'application/json'})
        resp = con.getresponse()
        url.append(str(json.loads(resp.read())['id']))
        print(resp.getcode())
        assert 201 == resp.getcode()

    with http.client.HTTPConnection(url[1]) as con:
        con.request('PUT', f'/{url[2]}/{url[3]}/', body=json.dumps(book2), headers={'Content-Type': 'application/json'})
        resp = con.getresponse()
        print(resp.getcode())

    with http.client.HTTPConnection(url[1]) as con:
        con.request('GET', f'/{url[2]}/{url[3]}/')
        resp = con.getresponse()
        j_dict = json.loads(resp.read().decode('utf-8'))
        assert book2['title'] == j_dict['title']
        assert book2['author'] == j_dict['author']
        print(resp.getcode())

    with http.client.HTTPConnection(url[1]) as con:
        con.request('DELETE', f'/{url[2]}/{url[3]}/')
        resp = con.getresponse()
        print(resp.getcode())
        assert resp.getcode() == 204


def library_person(b_url: str, r_url: str, book: dict, person1: dict, person2: dict):
    book_id = requests.post(url=b_url, data=book).json()['id']
    person1['book'] = person2['book'] = f'{b_url}{book_id}'
    person1_id = requests.post(url=r_url, data=person1).json()['id']
    person2_id = requests.post(url=r_url, data=person2).json()['id']
    person1['level'] = 100
    person2['level'] = 200
    requests.put(url=f'{r_url}{person1_id}', data=person1)
    requests.put(url=f'{r_url}{person2_id}', data=person2)
    assert person1['level'] == requests.get(f'{r_url}{person1_id}').json()['level']
    assert person2['level'] == requests.get(f'{r_url}{person2_id}').json()['level']
    for per in requests.get(r_url).json():
        if per['book'] == f'{b_url}{book_id}':
            per_id = per["id"]
            print(f'Deleting {r_url}{per_id}')
            requests.delete(f'{r_url}{per_id}')
    requests.delete(f'{b_url}{book_id}')


if __name__ == '__main__':
    books_url = 'http://pulse-rest-testing.herokuapp.com/books/'
    roles_url = 'http://pulse-rest-testing.herokuapp.com/roles/'
    book = {"title": "My Book",
            "author": "Dmytro Pochernin"}
    book2 = {"title": "Autobiography",
             "author": "Dmytro Pochernin"}
    person1 = {"name": "Dmytro Pochernin",
               "type": "Main hero",
               "level": 1,
               "book": ""}
    person2 = {"name": "Marina Pochernina",
               "type": "Main hero wife",
               "level": 1,
               "book": ""}
    library_changer(books_url, book, book2)
    library_person(books_url, roles_url, book, person1, person2)
    library_changer_http(books_url, book, book2)
