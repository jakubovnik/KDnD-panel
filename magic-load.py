import linecache
import os
import mysql.connector
def printf(something):
    print(something, end="")
def remove_last_three_characters(s):
    return s[:-3]
def get_file_names(directory):
    entries = os.listdir(directory)
    files = [file for file in entries if os.path.isfile(os.path.join(directory, file))]
    return files
def read_lines_2_to_5(filepath):
    line_numbers = [2, 3, 4, 5]
    lines = [linecache.getline(filepath, line_number).strip() for line_number in line_numbers]
    return lines
def convert_to_number_or_string(s):
    try:
        # Try to convert the string to a number
        num = int(s)
        return num
    except ValueError:
        # If conversion fails, return the original string
        return s

mydb = mysql.connector.connect(
    host = "localhost",
    user = "root",
    password = "",
    database = "kdnd"
)
cursor = mydb.cursor()

cursor.execute("SHOW TABLES")

magic_path = "C:/Users/Kubák/Documents/DnD/DnD/Magic/"
active_magic_path = magic_path + "Active spells/"
modification_magic_path = magic_path + "Modification spells/"

active_spells = get_file_names(active_magic_path)
modification_spells = get_file_names(modification_magic_path)

spells = []
for filename in active_spells:
    spell = [filename]
    after_colon = False
    lines = read_lines_2_to_5(active_magic_path + filename)
    print(remove_last_three_characters(filename))
    for line in lines:
        corrected_line = ""
        after_colon = False
        for char in line:
            if after_colon == True:
                corrected_line += char
            if char == ":":
                after_colon = True
        corrected_line = corrected_line.strip()
        corrected_line = corrected_line.replace("#", "")
        corrected_line = corrected_line.replace("%", "")
        print((corrected_line))
        spell.append(convert_to_number_or_string(corrected_line))

    print()