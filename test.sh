docker run --rm -e MY_ENV_VAR="Custom Value" -p 9000:8080 -d --name my-lambda-function my-lambda-function && \
curl -X POST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}' && \
docker container stop my-lambda-function
