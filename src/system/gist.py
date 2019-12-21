import requests
import pprint

user_name = 'pn11'

r = requests.get('https://api.github.com/users/{}/gists'.format(user_name))
gists = r.json()
print("No of gists = {}".format(len(gists)))


print('|Description|Created|Comments|')
print('|---|---|---|')

for gist in gists:
    gist_id = gist['id']

    print('|[{}]({})|{}|{}|'.format(gist['description'], gist['html_url'], gist['created_at'], gist['comments']))
