variable "credentials_file" {
  description = "The location of your google cloud platform credentials file"
  default     = "creds.json"
  type        = string
}

variable "project_id" {
  description = "The project id for your google cloud platform project"
  type        = string
}
