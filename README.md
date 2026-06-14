# Docker ROS 2
This repository hosts files for quickly getting a development environment for ROS 2 working in docker.

## 1. Name Your Package
In the `.env` file, set these values:

```bash
DOCKER_IMAGE="test:latest"
PACKAGE_NAME="my_robot_pkg"
```

## 2. Build Your Docker Container
I have provided a basic docker image. Build it using:

```bash
docker compose build
```

## 3. Create Your Package
Run this script to create a Python ROS 2 package:

```bash
./create_pkg.sh
```

This will create a new package folder in your current directory with the package name specified in the `.env` file.

This will create an image with the name specified in the `.env` file.

## 4. Build Your Workspace
This runs only the `build_package` service which will create a docker volume with all of the workspace files.

```bash
docker compose --profile build run --rm build_package
```

When you need to rebuild the workspace, run this again. Also note that if you are not using WSL, you'll need to comment out lines in the `docker-compose.yaml` file that have the comment `# only in WSL`

## 5. Start Your Services

I have created a service that will test your package to make sure everything is working and one that will publish "Hellow World". You should verify that you can see the "Hello World" message on the "/chatter" topic in foxglove.

```bash
docker compose up
```

## 6. Remove Everything
Kill the running services with `Ctrl+C`. Then remove all containers and volumes using:

```bash
docker compose down -v
```

## 7. Git
Dont forget to set your git username and email

```bash
git config user.name "Caleb Powell"
git config user.email "powellcalebm@gmail.com"
```