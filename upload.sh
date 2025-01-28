#!/bin/bash

# Get AWS Account ID and Region
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query "Account" --output text)
AWS_ACCOUNT_REGION=$(aws configure get region)

# Verify variables are set
if [[ -z "$AWS_ACCOUNT_ID" || -z "$AWS_ACCOUNT_REGION" ]]; then
  echo "Error: Unable to retrieve AWS_ACCOUNT_ID or AWS_ACCOUNT_REGION."
  exit 1
fi

# Repository name
REPOSITORY_NAME="my-lambda-function"

# Check if the repository exists
echo "Checking if ECR repository '$REPOSITORY_NAME' exists..."
REPOSITORY_EXISTS=$(aws ecr describe-repositories --repository-names "$REPOSITORY_NAME" --region "$AWS_ACCOUNT_REGION" 2>/dev/null)

if [[ -z "$REPOSITORY_EXISTS" ]]; then
  echo "Repository '$REPOSITORY_NAME' does not exist. Creating repository..."
  aws ecr create-repository --repository-name "$REPOSITORY_NAME" --region "$AWS_ACCOUNT_REGION"
  if [[ $? -ne 0 ]]; then
    echo "Error: Failed to create repository '$REPOSITORY_NAME'."
    exit 1
  fi
else
  echo "Repository '$REPOSITORY_NAME' already exists."
fi

# Authenticate Docker to AWS ECR
echo "Authenticating Docker to ECR..."
aws ecr get-login-password --region "$AWS_ACCOUNT_REGION" | docker login --username AWS --password-stdin "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_ACCOUNT_REGION.amazonaws.com"
if [[ $? -ne 0 ]]; then
  echo "Error: Docker authentication to ECR failed."
  exit 1
fi

# Tag and Push the Docker Image
echo "Tagging and pushing Docker image..."
docker tag "$REPOSITORY_NAME:latest" "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_ACCOUNT_REGION.amazonaws.com/$REPOSITORY_NAME:latest"
if [[ $? -ne 0 ]]; then
  echo "Error: Failed to tag Docker image."
  exit 1
fi

docker push "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_ACCOUNT_REGION.amazonaws.com/$REPOSITORY_NAME:latest"
if [[ $? -ne 0 ]]; then
  echo "Error: Failed to push Docker image to ECR."
  exit 1
fi

echo "Docker image successfully pushed to ECR repository: $AWS_ACCOUNT_ID.dkr.ecr.$AWS_ACCOUNT_REGION.amazonaws.com/$REPOSITORY_NAME:latest"
