#!/bin/bash

download_data() {
    url= "https://api.openweathermap.org/data/2.5/weather?q=Prague,cz&appid=your_api_key"
    curl -s "$url" 
}

while true; do
    download_data "https://api.openweathermap.org/data/2.5/weather?q=Prague,cz&appid=your_api_key" "weather_data.json"
    sleep 3600  # Run every hour
done
