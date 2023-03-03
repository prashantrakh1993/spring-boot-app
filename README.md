Prerequistes:
1. You need to have Sonarqube configurations to run sonarqube stage on your local environment.
2. Yo must have kubernetes cluster in order to deploy the application on kubernetes application. (Menifest files are avaialble in deploy directory)
3. Azure DevOps account to run the stages such Lint Stage,Test and Docker build - Push stage,Docker pull stage etc. (All the stages are writeen in azure-pipelines.yml)


How pipeline is implemented:

1. I have wrote build and execution logic for different stages in build.gradle file.
2. Automated the CI task using azure Devops as CI tool and gradle as the build tool.

******
build.gradle
******
This is a sample Gradle build file for a Spring Boot application. It includes several plugins, dependencies, and configurations.

Plugins
The following plugins are included in this build file:

org.springframework.boot version 2.7.5: This plugin adds support for building and running Spring Boot applications.

io.spring.dependency-management version 1.0.15.RELEASE: This plugin provides Maven-like dependency management for Gradle builds.

java: This plugin adds support for building Java projects.

checkstyle: This plugin adds support for enforcing code style rules.

jacoco: This plugin adds support for code coverage reports.

org.sonarqube version 3.3: This plugin adds support for analyzing code with SonarQube.

Dependencies
The following dependencies are included in this build file:

org.springframework.boot:spring-boot-starter: This dependency includes core Spring Boot libraries and configurations.

org.springframework.boot:spring-boot-starter-test: This dependency includes libraries for testing Spring Boot applications.

org.springframework.boot:spring-boot-starter-web: This dependency includes libraries for building web applications with Spring Boot.

Lint Stage
The checkstyle configuration in this build file specifies the version of Checkstyle to use, the location of the configuration file, and whether to show violations and fail the build if any are found.

Test Stage
The test configuration in this build file specifies the use of JUnit 5 for testing.

SonarQube Stage
The sonarqube configuration in this build file specifies the properties for analyzing code with SonarQube, including the project name, project key, organization, and host URL.

Docker Pull Stage
The pullDockerImage task in this build file specifies a command to pull a Docker image for a Spring Boot application.

***
azure-pipelines.yml
***

This repository contains an Azure Pipelines configuration file (azure-pipelines.yml) for building and deploying a Spring Boot application with Gradle, Docker, and SonarQube.

Configuration Overview
The pipeline has four stages:

LintBuildDocker: This stage runs Checkstyle to lint the code and then builds a Docker image of the application.
UnitTestandDockerBuildPush: This stage runs unit tests and then builds and pushes the Docker image to a Docker registry.
Docker_Pull: This stage pulls a Docker image from the Docker registry.
SonarQube_Stage: This stage runs SonarQube analysis on the code and generates a report.

Pipeline Configuration Details

Trigger
The pipeline is triggered on the dev branch.

Variables
The pipeline defines the following variables:

SONAR_PROJECT_NAME: The name of the project in SonarQube.
SONAR_PROJECT_KEY: The project key in SonarQube.
SONAR_ORGANIZATION: The name of the organization in SonarQube.
SONAR_HOST_URL: The URL of the SonarQube server.

Stages

LintBuildDocker
This stage has one job called Lint. The job runs Checkstyle to lint the code and then builds a Docker image of the application.

UnitTestandDockerBuildPush
This stage has one job called UnitTest. The job runs unit tests and then builds and pushes the Docker image to a Docker registry.

Docker_Pull
This stage has one job called Pull. The job pulls a Docker image from the Docker registry.



***
How to Run the pipeline
***

1. Clone the repository in your Azure DevOps Project.
2. Go to the pipelines section 
3. Select the repository
4. Run the pipeline. (Please edit Sonarqube configurations before Running the application)


***
HOW TO DEPLOY APPLICATION ON KUBERNETES
***

You need to follow following steps in order to deploy application on your kubernetes cluster
RUN FOLLOWING COMMANDS:

1. clone the repo on your folder
2. export KUBECONFIG=$(pwd)/PATH_TO_KUBECONFIG.yaml
3. run
    kubectl apply -f deploy/deployment.yaml
    kubectl apply -f deploy/service.yaml
    kubectl apply -f deploy/ingress.yaml (Note: You need to edit the endpoints and certificate/secret in ingress.yaml depending on your domain)





