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

In the client folder, run ```yarn deploy``` which will build the client and place it in the backend/build folder. 
The backend is configured to serve these static files, you just need to properly deploy the backend now. 
