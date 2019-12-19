shell:
	@echo "Opening heroku-18 shell..."
	@docker run -v $(shell pwd):/buildpack:ro -e STACK=heroku-18 --rm -it heroku/heroku:18-build bash -c 'mkdir -p /app /cache /env; cp -r /buildpack /buildpack_test; cd /buildpack_test/; bash'
	@echo ""
