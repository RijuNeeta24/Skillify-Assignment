import json
import requests


r = requests.get('https://coderbyte.com/api/challenges/json/json-cleaning')
data = r.json()

def clean_data(data):
    if(isinstance(data, dict)):
        to_be_deleted = []
        for k in data:
            if(isinstance(data[k], dict)):
                new_val = clean_data(data[k])
                data[k] = new_val
                
            if(isinstance(data[k], list)):
                new_val = clean_data(data[k])
                data[k] = new_val
                
            elif(isinstance(data[k], str)):
                if(data[k] == 'N/A'):
                    to_be_deleted.append(k)
                    
        for i in to_be_deleted:
            del data[i]
        return data
            
    if(isinstance(data, list)):
        to_be_deleted = []
        for i in range(len(data)):
            if(isinstance(data[i], dict)):
                new_val = clean_data(data[i])
                data[i] = new_val
                
            if(isinstance(data[i], list)):
                new_val = clean_data(data[k])
                data[i] = new_val
                
            elif(isinstance(data[i], str)):
                if(data[i] == 'N/A'):
                    to_be_deleted.append(i)
        for i in to_be_deleted:
            del data[i]
        return data
