all:
	docker rmi -f trackingchain
	docker build -t trackingchain .