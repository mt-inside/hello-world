run:
	mix run --no-halt

image:
	docker build . -t mtinside/hello-world-translator:latest

publish: image
	docker push mtinside/hello-world-translator
