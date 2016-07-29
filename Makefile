COMMANDS = help build clean publish
IMAGE_BASE_NAME= android-fastlane
IMAGE_REGISTRY= d3trax
IMAGE_FULL_NAME = $(IMAGE_REGISTRY)/$(IMAGE_BASE_NAME)
FOUND_IMAGES = $(shell docker ps -a | grep ' $(IMAGE_FULL_NAME) ' | cut -d' ' -f1)

.PHONY: $(COMMANDS)

help:
		@echo "Aviable commands $(COMMANDS)"

build:
		docker build -t $(IMAGE_FULL_NAME):latest .
		@echo "Build for image $(IMAGE_FULL_NAME) done."

clean:
		@echo "Cleaning $(IMAGE_FULL_NAME) $(FOUND_IMAGES)"
		docker rm -f $(FOUND_IMAGES) 2>/dev/null || true

publish:
		docker push $(IMAGE_FULL_NAME)