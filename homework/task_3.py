from os import remove

with open('..\\files_for_test\\source_file.txt', 'r', encoding='utf-8') as source_file:
    list_file = source_file.read().split()

list_file = sorted(list_file, key=str.lower)
end_dict = {}
for word in list_file:
    if word.isalpha():
        k = 0
        while True:
            try:
                list_file.remove(word)
                k += 1
            except ValueError:
                try:
                    list_file.remove(word.lower())
                    k += 1
                except ValueError:
                    end_dict[word] = k
                    break

try:
    remove('..\\files_for_test\\parsed_file.txt')
except FileNotFoundError:
    pass

with open('..\\files_for_test\\parsed_file.txt', 'x', encoding='utf-8') as parsed_file:
    for key, val in end_dict.items():
        print(key, val, sep=': ', file=parsed_file)

