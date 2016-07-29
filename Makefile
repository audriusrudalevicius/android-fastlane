COMMANDS = help build clean publish test
IMAGE_BASE_NAME = $(shell basename $(shell pwd))
IMAGE_REGISTRY = "d3trax"
IMAGE_FULL_NAME = $(IMAGE_REGISTRY)/$(IMAGE_BASE_NAME)
FOUND_IMAGES = $(shell docker ps -a | grep ' $(IMAGE_FULL_NAME) ' | cut -d' ' -f1)

.PHONY: $(COMMANDS)

help:
		@echo "Available commands $(COMMANDS)"

build:
		docker build -t $(IMAGE_FULL_NAME):latest .

clean:
		@echo "Cleaning $(IMAGE_FULL_NAME) $(FOUND_IMAGES)"
		docker rm -f $(FOUND_IMAGES) 2>/dev/null || true
test:
		run-parts -v --report -a $(IMAGE_FULL_NAME) ./test
publish:
		if [ "$DOCKER_EMAIL" != "" ]; then
			docker login -e="$DOCKER_EMAIL" -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD";
		fi
		docker push $(IMAGE_FULL_NAME);