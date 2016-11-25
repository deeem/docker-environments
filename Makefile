run:
	docker run --rm -v `pwd`:"/app" -w="/app/src" php php $(file) #example make run file=some-script.php

