from unidecode import unidecode


def convert_number(num):
    converted = unidecode(num)
    return converted;
