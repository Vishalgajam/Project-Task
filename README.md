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


Jenkins provisioner template:
It provisions an AWS EC2 instance using the specified AMI and instance type.
Jenkins is installed using user data script. The script updates the instance, installs Java OpenJDK 11, adds Jenkins repository, installs Jenkins, starts Jenkins service, and enables it to start on boot.
Docker Engine is also installed on the instance, and the Jenkins user is added to the docker group to allow Jenkins to interact with Docker.
Security group rules are defined to allow inbound traffic on port 8080(Jenkins web UI).The public IP address of the Jenkins instance is outputted at the end for easy access.


Deployment(blue-green).yaml:

The provided YAML manifests define Kubernetes Deployments and Services for blue and green deployments of an application named "my-app." The "my-app" application has two versions, "blue" and "green," indicating a blue-green deployment strategy.

For the blue deployment, a Deployment resource named "my-app-blue" is created with three replicas. It specifies labels for identifying the application ("app: my-app") and the deployment color ("color: blue"). The deployment template defines a container named "my-app" with an image pulled from a registry.This container exposes port 80.
Additionally, a Service named "my-app-blue-service" is defined to expose the blue deployment to external traffic. It selects pods based on the "app" and "color" labels and configures a LoadBalancer type service to route traffic to these pods on port 80.
Similarly, the green deployment follows the same structure but with "green" labels and names. The Deployment resource is named "my-app-green," and the Service is named "my-app-green-service." These resources facilitate the green deployment's access and functionality in the Kubernetes cluster.

Together, these YAML manifests enable the management and routing of traffic between the blue and green deployments, supporting a blue-green deployment strategy for the "my-app" application.

