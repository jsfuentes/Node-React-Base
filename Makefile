dev:
	docker-compose build
	docker-compose up

default: dev

prod:
	docker build -t prod_backend -f ./Dockerfile-prod .
	docker run -d -p 3001:3001 prod_backend