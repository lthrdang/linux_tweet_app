# Linux Tweet App

This is very simple NGINX website that allows a user to send a tweet. 

This project using EKS cluster to deploy website automatically by CircleCI.

## Deploy Cluster

EKS cluster is provisioned by CloudFormation was defined in `.circleci/files`.

### Prerequisites
- AWS account with default VPC and subnets.
- aws-cli installed on you machine.
- aws-cli is authentiated with AWS admin user.
- IAM role for the cluster with policy `AmazonEKSClusterPolicy` added.
- IAM role for the worker nodes with poicy `AmazonEKSWorkerNodePolicy`, `AmazonEC2ContainerRegistryReadOnly`, `AmazonEKS_CNI_Policy` added.

### Create EKS cluster

```bash
aws cloudformation deploy --stack-name LinuxTweet --template-file .circleci/files/kubernetes-cluster.yml
```

### Remember destroy cluster when you don't need anymore

```bash
aws cloudformation delete-stack --stack-name LinuxTweet
```
