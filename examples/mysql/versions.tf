terraform {
  required_version = ">= 1.0.10"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.16.0"
    }
  }
}
