import requests

def get_data():
    response = requests.get('http://localhost:8500/v1/kv/data')
    return response.json()

def main():
    data = get_data()
    print(data)

if __name__ == '__main__':
    main()