# Detect the operating system
ifeq ($(OS),Windows_NT)
    ARCHITECTURE := amd64
else
    ARCHITECTURE := $(shell dpkg --print-architecture)
endif

# Build the containers
.PHONY: up
up:
	docker-compose -f docker-compose.${ARCHITECTURE}.yml up -d

# Stop and remove containers
.PHONY: down
down:
	docker-compose -f docker-compose.${ARCHITECTURE}.yml down

# View logs
.PHONY: logs
logs:
	docker-compose -f docker-compose.${ARCHITECTURE}.yml logs -f

# Rebuild and run containers
.PHONY: rebuild
rebuild:
	docker-compose -f docker-compose.${ARCHITECTURE}.yml up --build -d

# Check the active containers
.PHONY: ps
ps:
	docker-compose ps

# Remove all containers and volumes
.PHONY: clean
clean:
	docker-compose -f docker-compose.${ARCHITECTURE}.yml down -v