variable "cluster_name" {
  type        = string
  default     = ""
}

variable "cluster_security_group_id" {
  type        = string
  default     = ""
}

variable "cluster_version" {
  type        = string
  default     = null
}

variable "tags" {
  type        = map(string)
  default     = {}
}

variable "cluster_tags" {
  type        = map(string)
  default     = {}
}


variable "cluster_endpoint_private_access" {
  type        = bool
  default     = false
}

variable "cluster_endpoint_public_access" {
  type        = bool
  default     = true
}

variable "node_groups_defaults" {
  type        = any
  default     = {}
}

variable "node_groups" {
  type        = any
  default     = {}
}

variable "cluster_service_ipv4_cidr" {
  type        = string
  default     = null
}

variable "cluster_egress_cidrs" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "workers_egress_cidrs" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "instance_types" {
  default = ""
}
variable "desired_size" {
  default = ""
}
variable "max_size" {
  default = ""
}
variable "min_size" {
  default = ""
}

