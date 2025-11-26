import requests
import pyperclip

key = "b15GoradoPaa76bs4GLXzkPYt0NOYMMx"
code = open("./dist/build.lua","r")


id = "https://pastebin.com/api/api_post.php"
data = {
    "api_dev_key": key,
    "api_paste_code": code.read(),
    "api_option": "paste",
    "api_paste_private": "1",
    "api_paste_expire_date": "10M",
}

# print(data)

response = requests.post(id, data=data)
response.raise_for_status()


id = response.text.split("/")[-1]
command = f"wget run https://pastebin.com/raw/{id}"
print(command)
pyperclip.copy(command)
