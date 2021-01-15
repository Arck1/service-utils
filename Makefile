.DEFAULT_GOAL := run

PYTHON = python

ENV_FILE = .env

CONTAINER_NAME = openvpn
HOST_NAME ?=
CLIENT_NAME ?=

.PHONY: init
init:
	docker-compose run --rm $(CONTAINER_NAME) ovpn_genconfig -u udp://$(HOST_NAME)
	docker-compose run --rm $(CONTAINER_NAME) ovpn_initpki

.PHONY: run
run:
	docker-compose up -d $(CONTAINER_NAME)

.PHONY: get_cert
get_cert:
	docker-compose run --rm openvpn ovpn_getclient $(CLIENT_NAME) > $(CLIENT_NAME).ovpn

.PHONY: new_cert
new_cert:
	docker-compose run --rm openvpn easyrsa build-client-full $(CLIENT_NAME) nopass


.PHONY: revoke_cert
revoke_cert:
	docker-compose run --rm openvpn ovpn_revokeclient $(CLIENT_NAME)

.PHONY: remove_cert
remove_cert:
	docker-compose run --rm openvpn ovpn_revokeclient $(CLIENT_NAME) remove