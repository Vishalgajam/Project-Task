# Project-Task
Demonstrate the ability to automate the deployment of a dockerized application using a Jenkins CI pipeline:

Overview of task files and steps to achieve the final output:

(downloader.sh, extractor.sh, html_generator.sh):

It starts by downloading weather data from the OpenWeatherMap API.
The downloaded data is then parsed to extract temperature and humidity information.
Extracted data is stored in a JSON file.
Finally, an HTML page is generated to display the extracted weather information.
This script essentially automates the process of fetching weather data for Prague, extracting relevant information, 
and presenting it in a human-readable format on an HTML page.

Dockerfile:
Dockerfile sets up an Alpine-based environment with the necessary tools (jq, curl) installed, copies shell scripts into the container, 
and configures the default behavior to execute the downloader.sh script upon container startup.

Terraform templates ( providers.tf, var.tf, main.tf):
The provided Terraform configuration script defines infrastructure on AWS using the AWS provider. It begins by specifying the required provider, 
in this case, "aws" from HashiCorp with a version constraint. Following this, the script configures the AWS provider, setting the region to "us-east-1" 
and specifying the access key and secret key using variables. Two variables are defined for the AWS access key and secret key, each with a description indicating their purpose. 
Next, it declares an AWS S3 bucket resource named "data_bucket" with a specified bucket name and access control list (ACL) set to "private". Lastly, an output is defined to expose the bucket name, 
retrieving it from the created S3 bucket resource. 

Jenkinsfile:
The provided script is a Jenkins pipeline script that automates the process of building a Docker image, provisioning cloud storage using Terraform, 
downloading data into the Docker container, storing the data in cloud storage, extracting relevant data, generating an HTML page, and deploying the HTML page to a server.

