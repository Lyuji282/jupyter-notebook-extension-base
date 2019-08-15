show-token:
		docker	exec	-it	jn	jupyter	notebook	list

build-container:
		docker-compose	up	-d	--build

start:
			@make build-container	&&	make show-token
