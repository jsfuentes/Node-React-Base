# Node-React-Base
This project contains two parts: a React frontend created using [create-react-app](https://github.com/facebook/create-react-app) and a NodeJS/Express backend created using express generator. There have been slight modifications to both that proxy the React requests to the express backend. 


## Setup
Because this project uses docker, docker and docker-compose are the only dependencies!
In main folder, simply run 
```
make
```
It might take a few moments to build the first time, especially the client. But it will automatically rebuild on changes, so development will be easy. Then you can access the server on port 3001 or the client on port 3000.

### Explanation
If you look into the Makefile, you can see the `make` command basically runs:
```
docker-compose build 
docker-compose up
```
[Docker-compose](https://docs.docker.com/compose/) allows you to easily run multiple docker containers and attach [volumes](https://docs.docker.com/storage/volumes/) which allows docker containers to directly access the files and file updates. Within both the backend and client, there is a Dockerfile specifying the build process. Both use yarn internally and run on a node:10.16.3-alpine image. 

To automatically update the client on changes, the [create-react-app](https://github.com/facebook/create-react-app) comes with a preconfigured webpack build that will hot reload on changes. The backend file uses nodemon for hot reloading. 

To allow the client to send request to the backend with just `/api/route` instead of something like `localhost:3001/api/route`, create-react-app comes with a setting in the package.json to [proxy the requests](https://create-react-app.dev/docs/proxying-api-requests-in-development). This circumvents CORS issues as well as issues when the React app is statically served in production. In the client package.json, the addition of the line `"proxy": "http://node_base:3001"` proxys the request to the node_base docker container as specified in the docker-compose.yml file. 

## Deploy 
Again very simple and the only requirement is docker 
You just get this repo on the deployment server and run the following commands:
```
make prod
```

This will build the client using react-scripts, place it in the backend/build folder, and then run the `yarn prod` in the backend. This all happens within the docker container specified by Dockerfile-prod. The backend is already configured to statically serve the built files. 
