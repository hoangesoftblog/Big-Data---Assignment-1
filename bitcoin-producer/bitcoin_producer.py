"""Produce openweathermap content to 'faker' kafka topic."""
import asyncio
import configparser
import os
import time
from collections import namedtuple
from kafka import KafkaProducer
import json
import requests
import datetime

url = "http://api.coincap.io/v2/rates/bitcoin"
payload = {}
headers = {}


def get_price():
    res = requests.get(url, headers=headers, data=payload)
    res_json = res.json()
    return {
        "time": res_json["timestamp"],
        "price": res_json["data"]["rateUsd"]
    }
    

KAFKA_BROKER_URL = os.environ.get("KAFKA_BROKER_URL")
TOPIC_NAME = os.environ.get("TOPIC_NAME")
SLEEP_TIME = int(os.environ.get("SLEEP_TIME", 10))



def run():
    iterator = 0
    print("Setting up faker producer at {}".format(KAFKA_BROKER_URL))
    producer = KafkaProducer(
        bootstrap_servers=[KAFKA_BROKER_URL],
        # Encode all values as JSON
        value_serializer=lambda x: json.dumps(x).encode("utf-8"),
    )

    while True:        
        # adding prints for debugging in logs
        print("Sending new Bitcoin data iteration - {}".format(iterator))
        bitcoin_info = get_price()
        print(bitcoin_info)
        producer.send(TOPIC_NAME, value=bitcoin_info)
        print("Updated Bitcoin price sent")
        time.sleep(SLEEP_TIME)
        print("Waking up!")
        iterator += 1


if __name__ == "__main__":
    run()
