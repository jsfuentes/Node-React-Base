# Node-React-Base
This project contains two parts: a React frontend created using react-starter and a NodeJS/Express backend created using express generator. There have been slight modifications to both that proxy the React requests to the express backend. 


## Setup
Because this project uses docker, docker and docker-compose are the only dependencies!
In main folder, simply run 
```
docker-compose build 
docker-compose up
```
Then you can access the server on port 3001 or the client on port 3000. It will be rebuilt on changes. 

## Deploy 
Again very simple and the only requirement is docker 
You just get this repo on the deployment server and run the following commands:
```
docker build -t prod_backend -f ./Dockerfile-prod .
docker run -d -p 80:3001 prod_backend
```
For you convience, you can also just run `make`

This will build the client using react-scripts, place it in the backend/build folder, and then run the `yarn prod` in the backend. This all happens within the docker container specified by Dockerfile-prod. The backend is configured to statically serve the built files. 
