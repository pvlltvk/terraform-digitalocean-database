variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_vpc" "foo-bar-vpc-nyc3" {
  name   = "foo-bar-vpc-nyc3"
  region = "nyc3"
}

resource "digitalocean_droplet" "web" {
  image    = "ubuntu-18-04-x64"
  name     = "web-nyc3"
  region   = "nyc3"
  size     = "s-1vcpu-1gb"
  vpc_uuid = digitalocean_vpc.foo-bar-vpc-nyc3.id
}

module "cluster" {
  source                       = "../../"
  cluster_name                 = "redis-nyc3"
  cluster_engine               = "redis"
  cluster_version              = "6"
  cluster_size                 = "db-s-1vcpu-1gb"
  cluster_region               = "nyc3"
  cluster_node_count           = 1
  cluster_private_network_uuid = digitalocean_vpc.foo-bar-vpc-nyc3.id
  cluster_tags                 = ["foo", "bar"]
  redis_eviction_policy        = "volatile_lru"
  cluster_maintenance = {
    maintenance_hour = "02:00:00"
    maintenance_day  = "saturday"
  }

  create_firewall = true
  firewall_rules = [
    {
      type  = "droplet",
      value = digitalocean_droplet.web.id
    }
  ]
}
