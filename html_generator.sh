#!/bin/bash

# Generate HTML page with extracted data
cat <<EOF > prague_weather.html
<html>
<head>
  <title>Prague Weather</title>
</head>
<body>
  <h1>Current Weather in Prague</h1>
  <p>Temperature: $temperature °C</p>
  <p>Humidity: $humidity %</p>
</body>
</html>
EOF