
variable "region" {
  default = "us-east-1"
}
variable "cluster_name" {
  default = "webapp-cluster"
}

variable "app_name" {
  default = "webapp-front"
}

variable "app_env" {
  default = "dev"
}

variable "tag-build" {
  default = "build-v1.0.0"
}

variable "tag-runtime" {
  default = "runtime-v1.0.0"
}
