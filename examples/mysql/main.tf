variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_vpc" "foo-bar-vpc-nyc1" {
  name   = "foo-bar-vpc-nyc1"
  region = "nyc1"
}

resource "digitalocean_droplet" "web" {
  image    = "ubuntu-18-04-x64"
  name     = "web-nyc1"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"
  vpc_uuid = digitalocean_vpc.foo-bar-vpc-nyc1.id
}

module "cluster" {
  source                       = "../../"
  cluster_name                 = "mysql-nyc1"
  cluster_engine               = "mysql"
  cluster_version              = "8"
  cluster_size                 = "db-s-2vcpu-4gb"
  cluster_region               = "nyc1"
  cluster_node_count           = 2
  cluster_private_network_uuid = digitalocean_vpc.foo-bar-vpc-nyc1.id
  cluster_tags                 = ["foo", "bar"]
  mysql_sql_mode               = "ANSI,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION,NO_ZERO_DATE,NO_ZERO_IN_DATE,STRICT_ALL_TABLES,ALLOW_INVALID_DATES"
  cluster_maintenance = {
    maintenance_hour = "02:00:00"
    maintenance_day  = "saturday"
  }

  databases = ["foo-database", "bar-database"]

  users = [
    {
      name              = "foo-user",
      mysql_auth_plugin = "mysql_native_password"
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
