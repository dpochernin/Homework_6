from os import remove


class Person:
    def __init__(self, surname: str = None, name: str = None, department: str = None, salary: int = None):
        self.surname = surname
        self.name = name
        self.department = department
        self.salary = int(salary)

    def __str__(self):
        return f'{self.surname} {self.name}, {self.department}, {self.salary}'


def read_file(file, encoding) -> list:
    with open(file, 'r', encoding=encoding) as firm:
        lines = firm.readlines()[1:]
    person_list = []
    for line in lines:
        person_list.append(Person(*line.split()))
    return person_list


def dep_count(person_list) -> int:
    departments = []
    for person in person_list:
        departments.append(person.department)
    return len(set(departments))


def max_salary(person_list) -> Person:
    max_person = person_list[0]
    for person in person_list:
        if person.salary > max_person.salary: max_person = person
    return max_person


def max_salary_per_dep(person_list):
    salary_dep = dict((person.department, person.salary) for person in person_list)
    for person in person_list:
        if person.salary > salary_dep[person.department]:
            salary_dep[person.department] = person.salary
    return salary_dep


if __name__ == '__main__':
    per_list = read_file(file='..\\files_for_test\\firm.txt', encoding='utf-8')
    print(dep_count(per_list))
    emp = max_salary(per_list)
    print(emp)
    print(max_salary_per_dep(per_list))
    try:
        remove('..\\files_for_test\\max_employ.txt')
    except FileNotFoundError:
        pass
    with open('..\\files_for_test\\max_employ.txt', 'x', encoding='utf-8') as file:
        file.write(f'{emp.department} {emp.salary} {emp.surname}')