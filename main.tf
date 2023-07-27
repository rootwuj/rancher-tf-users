terraform {
  required_providers {
    rancher2 = {
      source = "rancher/rancher2"
      version = "3.1.0"
    }
  }
}

provider "rancher2" {
  api_url   = var.rancher_url
  token_key = var.rancher_token_key
  insecure  = true
}

data "rancher2_global_role" "standard_user" {
  name = "User"
}

resource "rancher2_global_role_binding" "test_user_binding" {
  count          = var.user_count
  global_role_id = data.rancher2_global_role.standard_user.id
  user_id        = rancher2_user.test_user[count.index].id
}


resource "rancher2_user" "test_user" {
  count    = var.user_count
  name     = "tuser${count.index}"
  username = "tuser${count.index}"
  password = var.user_password
  enabled  = true
}

# Variable section

variable "rancher_url" {
  type        = string
  description = "URL for Rancher."
}

variable "rancher_token_key" {
  type        = string
  description = "API bearer token for Rancher."
  sensitive   = true
}

variable "user_count" {
  type        = number
  description = "Amount of users that you would like to create within Rancher."
}

variable "user_password" {
  type        = string
  description = "Password for users created through this TF module."
  sensitive   = true
}
