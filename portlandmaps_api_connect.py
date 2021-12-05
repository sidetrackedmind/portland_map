'''
write function to connect to portlandmaps api
'''
import requests

def single_request(url, api_key, property_id):
    params = {'api_key': api_key, 'property_id': property_id}
    r = requests.get(url,params=params)
    try:
        if r.status_code == 200:
            return r.content
    except:
        logging.error('status code {}'.format(r.status_code))