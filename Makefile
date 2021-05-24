IMAGE=registry.hq.dancysoft.com/watcher:1

all: image push apply

image:
	docker build -t $(IMAGE) .

push:
	docker push $(IMAGE)

test:
	docker run --rm -v /tmp:/vol watcher:latest /vol/myfile

apply:
	kubectl apply -f manifests/


