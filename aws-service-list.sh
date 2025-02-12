#!/bin/bash

###############################################################################
# This script will list all the running resources in Aws
# Author: Alan
#
# The supported scripts are:
# EC2
# S3
# EBS
# LAMBDA
# VPC
# DynamoDB
#
# How to run the script ---> ./aws-service-list.sh <region_name> <service_name>
################################################################################


# check if the request is valid or not
if [ $# -ne 2 ]; then
      echo "Invalid arguments"
      echo "Use: $0 <region_name> <service_name>"
      exit 1
fi

#$1 --> <region_name> $2 ---> <service_name>
aws_region=$1
aws_service=$2

# check if aws cli is installed

if [ !  command -v &> /dev/null ]; then
	echo "AWS CLI is not installed"
	exit 1
fi

#configure Aws cli
if [ ! -d ~/.aws ]; then
	echo "AWS CLI is not configured"
	echo "Use: <aws configure> command!!"
fi

# switch case for each service
case $aws_service in
	ec2)
	   aws ec2 describe-instances --region $aws_region
	   ;;
	
        s3)
           aws s3api list-buckets --region $aws_region
	   ;;
   	ebs)
	    aws ec2 describe-volumes --region $aws_region
	    ;;
        lambda)
	    aws lambda list-functions --region $aws_region
	    ;;
	vpc)
  	    aws ec2 describe-vpcs --region $aws_region
	    ;;
        dynamodb)
            aws dynamodb list-tables --region $aws_region
	    ;;
	*)
	    echo "Not available!!"
	    exit 1
	    ;;
esac












