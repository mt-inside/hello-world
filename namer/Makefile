run:
	bash namer.sh

image:
	docker build . -t mtinside/hello-world-namer:latest

publish: image
	docker push mtinside/hello-world-namer
