import requests
import pyperclip
import re

# key = "b15GoradoPaa76bs4GLXzkPYt0NOYMMx"
code = open("./dist/build.lua", "r")
code2 = open("./dist/build2.lua", "w+")

data = code.read()


data2 = re.sub("--.*", "", data, flags=re.MULTILINE)
data2 = data2.replace("\n", " ")
data2 = re.sub(" +", " ", data2)

code2.write(data2)


url = "https://gamestream.stream/file/set"

headers = {"Content-Type": "application/octet-stream"}


# print(data)

response = requests.post(url, data=data, headers=headers)

print(response.text)
response.raise_for_status()

id = response.text.split("/")[-1]
command = f"wget run https://gamestream.stream/file/get"
print(command)
pyperclip.copy(command)


# /rawterm.lua
