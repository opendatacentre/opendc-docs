.PHONY: parse

help:
	@echo "clean   - remove all build artifacts"
	@echo "parse   - parse configuration"
	@echo "build   - generate docs"
	@echo "package - create a Docker image"
	@echo "run     - run Docker container"
	@echo "rm      - remove Docker container"
	@echo "publish - publish Docker image"
	@echo "install - install Gitbook"
	@echo "plugins - install Gitbook plugins"


clean:
	@echo Removing docs/_book/ 
	@rm -Rf docs/_book/

parse:
	@echo Parsing configuration
	@cd docs; gitbook parse

build: clean
	@echo Generating docs
	@cd docs; gitbook build

package: build
	@echo Creating Docker image
	@docker build -t opendatacentre/opendc-docs .

run:
	@echo Running Docker container
	@if [[ `docker ps -a | grep opendc-docs` != "" ]]; then docker rm -f opendc-docs; fi
	@docker run -d --name opendc-docs -p 80:80 opendatacentre/opendc-docs

rm:
	@echo Removing Docker container
	@docker rm -f opendc-docs

publish:
	@echo Publishing Docker image
	@docker push opendatacentre/opendc-docs