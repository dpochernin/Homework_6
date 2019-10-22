import requests

roles_url = 'http://pulse-rest-testing.herokuapp.com/roles/'
books_url = 'http://pulse-rest-testing.herokuapp.com/books/'

params = {"type": "Wizard"}
respons = requests.get(roles_url, params)

params = {'book_id': ''}
for book in requests.get(books_url).json():
    if book['title'] == 'Harry Potter': params['book_id'] = book['id']
print(requests.get(roles_url, params).json())

params['level'] = 2
print(requests.get(roles_url, params).json())

params = {'level__gte': 100, 'level__lt': 1000, 'book_id': 1}
print(requests.get(roles_url, params).json())

params['level__lt'] = 100500
print(requests.get(roles_url, params).json())

params = {'level__gte': 100, 'level__lte': 100500, 'book_id': 1}
print(requests.get(roles_url, params).json())

