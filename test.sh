docker run --rm  -p 9000:8080 -d --name my-lambda-function my-lambda-function && \
curl -X POST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{"body": {"name": "Alice"}}' && \
docker container stop my-lambda-function

docker run --rm  -p 9000:8080 -d --name my-lambda-function my-lambda-function && \
curl -X POST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{"body": {}}' && \
docker container stop my-lambda-function
