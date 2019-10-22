from os import remove


def song_gen(strings=3, words=3, fin=0) -> str:
    """Функция генерирует песню\n
    strings= - сколько строк будет в песне. По умолчанию 3\n
    words= - сколько «la» будет в строке («la» в строке объединяются дефисом). По умолчанию 3\n
    fin= - если 0, то в конце песни (в конце последней строчки) стоит точка, если 1, то в конце стоит «!».
    По умолчанию 0. Если fin не 0 или 1 генерируется
    ! если strings и words отрицательные - берем их по модулю"""
    from math import ceil
    # выполняем выполняем проверки на int, в случае неуспеха генерируется TypeError
    strings = ceil(int(strings))
    words = ceil(int(words))
    assert fin == 0 or fin == 1, "fin={}, must be 0 or 1 only".format(fin)  # переделана проверка на ассерт

    # генерируем песенку
    song_string = ['la'] * words
    song = ('-'.join(song_string) + '\n') * strings
    if fin == 1:
        song = song[:-1] + '!'
    else:
        song = song[:-1] + '.'
    return song


if __name__ == '__main__':
    f_name = '..\\files_for_test\\la-la.txt'

    try:
        remove(f_name)
    except FileNotFoundError:
        pass
    with open(f_name, 'x') as out_file:
        out_file.write(song_gen())

    try:
        remove(f_name)
    except FileNotFoundError:
        pass
    with open(f_name, 'x') as out_file:
        print(song_gen(), file=out_file)

    with open(file='..\\lesson\\ftp_server.py', mode='r', encoding='utf-8') as read_file:
        for s in read_file:
            print(s, end='')

    out_file = open('..\\files_for_test\\digit1.txt', 'r')
    try:
        for line in out_file:
            dig = int(line)
    except ValueError:
        pass
    else:
        print('I did it!')
    finally:
        out_file.close()
