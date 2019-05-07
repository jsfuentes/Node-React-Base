FRONTEND_NAME = react_base
BACKEND_NAME = node_base
FRONTEND_PORT = 3000
BACKEND_PORT = 3001

build-backend:
	docker build -t $(BACKEND_NAME) ./backend

build-frontend:
	docker build -t $(FRONTEND_NAME) ./client 

build: build-backend build-frontend 
	
dev: build 
	docker run -d -p $(FRONTEND_PORT):$(FRONTEND_PORT) $(FRONTEND_NAME)
	docker run -d -p $(BACKEND_PORT):$(BACKEND_PORT) $(BACKEND_NAME)
	