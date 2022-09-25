variable "compartment_id" {
  description = "the compartment id for your oracle cloud project from your tenancy page"
  type        = string
}

variable "oci_region" {
  description = "your oci region"
  default     = "us-sanjose-1"
  type        = string
}