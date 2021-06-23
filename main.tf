terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "AWS_PROFILE"
  region  = "us-east-1"
}

resource "aws_instance" "jenkins_ssh_agent" {
  ami           = "ami-830c94e3"
  instance_type = "t3a.medium"

  tags = {
    Name = "jenkins-ssh-agent"
  }
}

