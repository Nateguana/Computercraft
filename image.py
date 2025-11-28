from PIL import Image
import requests


url = "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/428.png"

response = requests.get(url, stream=True, timeout=1000)

image = Image(response.content)



