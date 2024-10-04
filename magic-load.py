# import linecache
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
# def read_lines_2_to_5(filepath):
#     line_numbers = [2, 3, 4, 5]
#     lines = [linecache.getline(filepath, line_number).strip() for line_number in line_numbers]
#     return lines
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

cursor.execute("SELECT * from kdnd.character")
result = cursor.fetchall()

magic_path = "C:/Users/Kubák/Documents/DnD/DnD/Magic/"
active_magic_path = magic_path + "Active spells/"
modification_magic_path = magic_path + "Modification spells/"

active_spells = get_file_names(active_magic_path)
modification_spells = get_file_names(modification_magic_path)

spells = []
for filename in active_spells:
    spell = [remove_last_three_characters(filename)]
    after_colon = False
    magic_file = open(active_magic_path + filename)
    # lines = read_lines_2_to_5(active_magic_path + filename)
    # print(remove_last_three_characters(filename))
    selected_line = 1
    descriptions = 0
    rules = ""
    effects = ""
    limits = ""
    tags = ""
    other = ""
    for line in magic_file:
        if selected_line == 1:
            selected_line = selected_line + 1
            continue
        elif selected_line in [2, 3, 4, 5]:
            corrected_line = ""
            after_colon = False
            for char in line:
                if after_colon == True:
                    corrected_line += char
                if char == ":":
                    after_colon = True
            corrected_line = corrected_line.replace("#", "")
            corrected_line = corrected_line.replace("%", "")
            corrected_line = corrected_line.strip()
            # print((corrected_line))
            # spell.append(convert_to_number_or_string(corrected_line))
            spell.append(corrected_line)
        else:
            if line[0] == '#':
                descriptions = descriptions + 1
                selected_line = selected_line + 1
                continue
            if descriptions == 1:
                rules = rules + line
            elif descriptions == 2:
                effects = effects + line
            elif descriptions == 3:
                limits = limits + line
            elif descriptions == 4:
                tags = tags + line
            elif descriptions == 5:
                other = other + line
        selected_line = selected_line + 1
    rules = rules.strip()
    spell.append(rules)
    effects = effects.strip()
    spell.append(effects)
    limits = limits.strip()
    spell.append(limits)
    tags = tags.strip()
    spell.append(tags)
    other = other.strip()
    spell.append(other)
    for thing in spell:
        print(thing)
    spells.append(spell)
for spell in spells:
    cursor.execute('INSERT INTO kdnd.magic (`name`, `origin`, `complexity`, `fail_rate`, `cast_time`, `rules`, `effects`, `limits`, `tags`, `other`, `is_mod`) VALUES ("'+ spell[0] +'", "'+ spell[1] +'", "'+ spell[2] +'", "'+ spell[3] +'", "'+ spell[4] +'", "'+ spell[5] +'", "'+ spell[6] +'", "'+ spell[7] +'", "'+ spell[8] +'", "'+ spell[9] +'", "0");')
mydb.commit()