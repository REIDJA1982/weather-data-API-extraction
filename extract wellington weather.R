library(httr)

# Define the API endpoint, location and time range
endpoint <- "https://api.openweathermap.org/data/2.5/weather"
location <- "Wellington,nz"

# Define the API key
api_key <- "cfa930419720c9c24262607f72f73196"

# Send a GET request to the API
response <- GET(endpoint, query=list(q=location,appid=api_key,units="metric"))

# Extract the data from the response
data <- content(response)

# Extract the temperature
temperature <- data$main$temp

# Extract the wind speed
wind_speed <- data$wind$speed

# Convert the wind speed from m/s to km/h
wind_speed_kmh <- wind_speed * 3.6

# Extract the humidity
humidity <- data$main$humidity

# Print the temperature, wind speed and humidity
cat("The temperature in Wellington right now is", temperature, "°C\n")
cat("The wind speed is", wind_speed_kmh, "km/h\n")
cat("The humidity level is", humidity, "%\n")
