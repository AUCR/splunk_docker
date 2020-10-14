from logging import info
with open("app_info.txt") as yaml_file:
    test_data = yaml_file.readlines()

new_list = ""
for line in test_data:
    value_string = line[:1]
    if len(line) < 2:
        info("Ignore Space")
    elif "#" == value_string:
        info("Ignore comment")
    else:
        new_list += line[:-1] + ","
print(f"SPLUNK_APPS_URL=\"{new_list[:-1]}\"")
