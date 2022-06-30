import json
import requests
from autoextract.sync import request_raw
from newsapi import NewsApiClient

api = NewsApiClient(api_key='4fb1ee6895d543c494561dd7ab5fa45e')



query = [{
    'url': 'https://www.washingtonpost.com/politics/2022/06/13/biden-frustration-soaring-gas-prices/',
    'pageType': 'article'
}]
results = request_raw(query, api_key='ce0a5dc4c9a0488e9516db7409292a31')


###

API_URL = "https://api-inference.huggingface.co/models/google/pegasus-multi_news"
headers = {"Authorization": "Bearer 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"}

def query(payload):
	response = requests.post(API_URL, headers=headers, json=payload)
	return response.json()

output = query({
	"inputs": results[0]['article']['articleBody'],
    "parameters": {"do_sample": False, "min_length": 55, "max_length": 65, "repetition_penalty": 1.3}, 
    })   

original_text = results[0]['article']['articleBody']
summary = output[0]['summary_text']
headline = results[0]['article']['headline']
image = results[0]['article']['mainImage']

print(original_text)
print(headline)
print(summary)
print(image)


