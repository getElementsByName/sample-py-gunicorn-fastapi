init:
	mkdir -p ./logs

start: init
	gunicorn --reload --worker-class uvicorn.workers.UvicornWorker --bind 0.0.0.0:8000 fastapi_main:app --workers 1 --log-level debug --capture-output --timeout 0 --worker-connections 1

start.simple: init
	gunicorn --reload --worker-class gevent --bind 0.0.0.0:8000 simple_main:app --workers 1 --log-level debug --capture-output --timeout 0 --worker-connections 1

test.stress: 
	locust --conf ./test/locust.config.ini

build.docker:
	docker-compose -f docker/docker-compose.yaml build

start.docker:
	docker-compose -f docker/docker-compose.yaml build

RUN_SERVICE_NAME=main
debug.docker:
	docker-compose -f docker/docker-compose.yaml run --rm --service-ports --entrypoint=bash $(RUN_SERVICE_NAME)


ip_range:
	sysctl -w net.ipv4.ip_local_port_range="60000 60004"