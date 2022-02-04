variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_vpc" "foo-bar-vpc-sfo3" {
  name   = "foo-bar-vpc-sfo3"
  region = "sfo3"
}

resource "digitalocean_droplet" "web" {
  image    = "ubuntu-18-04-x64"
  name     = "web-sfo3"
  region   = "sfo3"
  size     = "s-1vcpu-1gb"
  vpc_uuid = digitalocean_vpc.foo-bar-vpc-sfo3.id
}

module "cluster" {
  source                       = "../../"
  cluster_name                 = "mongodb-sfo3"
  cluster_engine               = "mongodb"
  cluster_version              = "4"
  cluster_size                 = "db-s-2vcpu-4gb"
  cluster_region               = "sfo3"
  cluster_node_count           = 3
  cluster_private_network_uuid = digitalocean_vpc.foo-bar-vpc-sfo3.id
  cluster_tags                 = ["foo", "bar"]
  cluster_maintenance = {
    maintenance_hour = "02:00:00"
    maintenance_day  = "saturday"
  }

  databases = ["foo-database", "bar-database"]

  users = [
    {
      name = "foo-user"
    },
    {
      name = "bar-user"
    }
  ]

  create_firewall = true
  firewall_rules = [
    {
      type  = "droplet",
      value = digitalocean_droplet.web.id
    }
  ]
}
