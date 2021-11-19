# DnB-Defender-ECS

Prisma Defender Automation for ECS and Lambda

# ECS + Terraform

This repo contains a set of [Terraform](https://terraform.io/) modules for
provisioning an [AWS ECS](https://aws.amazon.com/ecs/) cluster and registering
services with it.

This provisions _everything_, including its own VPC and related
networking accoutrements. It does not handle setting up a Docker Registry. It
does not do anything about attaching other AWS services (e.g. RDS) to a
container.

## Deploying

In addition to the Terraform modules, there is a script for doing deployments to
ECS.

To execute a deployment:

```console
$ # Push a container to your docker registry
$ python deploy/ecs-deploy.py deploy --cluster=<cluster> --service=<service> --image=<image>
```

It will then update the image being used by that service's task. ECS will handle
updating the running containers. (Be aware that you must have as many EC2
instances in the cluster as 2x the number of running tasks for your service.)

The other way to deploy a new task is to add a new service and a new task in modules/ecs/main.tf.

# Terraform-AWS-ECS

Terraform modules for creating a production ready ECS Cluster in AWS.

Features:
* High-availability (Multi-AZ)
* Loadbalanced (ALB)
* Isolated in a VPC
* Private -> Public access (NAT'd)
* Auto-scaling

## Usage:

* Specify the AWS region to create resources into, in **variables.tf**, using `aws_region` variable.
* Specify the AMI to build your ECS instance from, in **variables.tf**, using `aws_ecs_ami` variable.
  * Leave empty to use the latest Linux 2 ECS-optimized AMI by Amazon.
  * Find the latest recommended Linux 2 ECS-optimized AMI for current aws-cli region:
  
  ```
  aws ssm get-parameters --names /aws/service/ecs/optimized-ami/amazon-linux-2/recommended
  ```
  
  * Manually find latest recommended ECS-optimized AMI for any region or OS:
  
  Check here: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html
* ssh-keygen -t rsa -b 4096 to generate a key pair. Update the value of ssh_key with the public key generated.
* Go to Prisma console ->MANAGER->Defenders->Deploy tab->Orchestrator button->Choose the orchestrator type: ECS. Download the defender task definition. 
* Copy the downloaded Prisma task definition json file to modules/ecs/task_definitions folder.
* In pc-defender.json remove the [volumes] section.  This section is already defined in the modules/ecs/main.tf file.

## Create it

*You'll need to install Terraform CLI if you haven't already done so. The instructions can be found here: https://learn.hashicorp.com/tutorials/terraform/install-cli.*

Make sure you've updated **provider.tf** to indicate your aws profile and region before creating.


```bash
terraform init 
terraform plan 
terraform apply

