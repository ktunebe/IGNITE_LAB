variable "project_name" {
  description = "Name of the project, used as a prefix for all resources"
  type        = string
  default     = "ignite-kent"
}

variable "aws_region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "us-west-1"
}

variable "environment" {
  description = "Deployment environment (e.g. dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "container_image_tag" {
  description = "Tag of the container image to deploy"
  type        = string
  default     = "v1"
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
  default     = 80
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.10.32.0/20"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets (one per AZ)"
  type        = list(string)
  default     = ["10.10.32.0/24", "10.10.33.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets (one per AZ)"
  type        = list(string)
  default     = ["10.10.34.0/24", "10.10.35.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones to deploy into"
  type        = list(string)
  default     = ["us-west-1a", "us-west-1b"]
}

variable "task_cpu" {
  description = "CPU units for the ECS task (256 = 0.25 vCPU)"
  type        = number
  default     = 256
}

variable "task_memory" {
  description = "Memory (MiB) for the ECS task"
  type        = number
  default     = 512
}

variable "desired_count" {
  description = "Desired number of ECS tasks"
  type        = number
  default     = 2
}

variable "client_id_secret" {
  description = "Value for the CLIENT_ID secret stored in Secrets Manager"
  type        = string
  sensitive   = true
  default     = "placeholder-client-id"
}
