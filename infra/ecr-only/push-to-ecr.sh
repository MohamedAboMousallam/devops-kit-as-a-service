#!/bin/bash

AWS_REGION="eu-north-1"
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
REPO_NAME="devops-kit-app"
IMAGE_TAG="latest"
IMAGE_NAME="devops-kit-app"

# Get full repo URL
ECR_URL="$ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$REPO_NAME"

# Authenticate
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_URL

# Tag and push
docker tag $IMAGE_NAME:$IMAGE_TAG $ECR_URL:$IMAGE_TAG
docker push $ECR_URL:$IMAGE_TAG
