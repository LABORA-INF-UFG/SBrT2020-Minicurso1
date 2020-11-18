DOCKER_IMAGE_OWNER_UE='my5gcore'
DOCKER_IMAGE_NAME_UE='ue'
DOCKER_IMAGE_TAG_UE='latest'



.PHONY: base
base:

	docker build -t ${DOCKER_IMAGE_OWNER_UE}/${DOCKER_IMAGE_NAME_UE}:${DOCKER_IMAGE_TAG_UE} ./base_ue
	docker image ls ${DOCKER_IMAGE_OWNER_UE}/${DOCKER_IMAGE_NAME_UE}:${DOCKER_IMAGE_TAG_UE}

	docker build -t lora:latest  ./chirpstack-simulator
	docker image ls lora:latest
