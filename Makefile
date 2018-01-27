#!make

# docker
build:
	docker build -t 0x7c48/haskell.com.ua:elm .
docker-run:
	docker run -i -d --name nginx-elm -p 80:80 0x7c48/shaskell.com.ua:elm

docker-ps-rm:
	docker ps -a |xargs docker rm
docker-images-rm:
	docker images -q |xargs docker rmi


# frontend
FE_ROOT ?= client
FE_SRC ?= src
FE_BUILD ?= dist/build

github-pages:
	rm index.html && \
	rm main.js && \
	cp client/index.html . && \
	cp client/main.js .

reload-fe:
	cd $(FE_ROOT) && \
	elm-live $(FE_SRC)/Main.elm \
		--output=main.js \
		--host=localhost \
		--port=8000

build-fe:
	cd $(FE_ROOT) && \
	elm-make $(FE_SRC)/Main.elm --output=$(FE_BUILD)/main.js

elm-repl:
	cd $(FE_ROOT) && \
	elm-repl

elm-format:	
	elm-format client/
