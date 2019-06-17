run:
	cargo run

image:
	docker build . -t mtinside/hello-world-greeter:latest

publish: image
	docker push mtinside/hello-world-greeter
