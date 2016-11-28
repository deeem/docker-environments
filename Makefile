run:
	docker run -d -p 8080:8000 -v `pwd`:/app --name=hexlet-http deeem/hexlet-http php -S 0.0.0.0:8000 -t /app/src

