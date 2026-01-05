variable "bucket1_name" {
  description = "Name of the first S3 bucket"
  type        = string
  default     = "ecommerce-eks-us-east-1-vsarath"
}

variable "bucket2_name" {
  description = "Name of the second S3 bucket"
  type        = string
  default     = "ecommerce-eks-us-east-1-vsarath-2"
}

variable "environment" {
  description = "Environment tag for the buckets"
  type        = string
  default     = "dev"
}
