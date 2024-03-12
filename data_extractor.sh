#!/bin/bash

# Extract specific data relevant to Czechia, Prague from downloaded datasets
temperature=$(jq -r '.main.temp' "weather_data.json")
humidity=$(jq -r '.main.humidity' "weather_data.json")

# Store extracted data in a JSON file
echo "{\"temperature\":\"$temperature\",\"humidity\":\"$humidity\"}" > "prague_weather.json"