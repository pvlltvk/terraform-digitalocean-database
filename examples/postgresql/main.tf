variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_vpc" "foo-bar-vpc" {
  name   = "foo-bar-vpc"
  region = "fra1"
}

module "cluster" {
  source                       = "../../"
  cluster_name                 = "postgresql-fra1"
  cluster_engine               = "pg"
  cluster_version              = "13"
  cluster_size                 = "db-s-2vcpu-4gb"
  cluster_region               = "fra1"
  cluster_node_count           = 2
  cluster_private_network_uuid = digitalocean_vpc.foo-bar-vpc.id
  cluster_tags                 = ["foo", "bar"]

  databases = [
    {
      name = "foo-database"
    },
    {
      name = "bar-database"
    }
  ]

  users = [
    {
      name = "foo-user"
    },
    {
      name = "bar-user"
    }
  ]

  create_pool = true
  pools = [
    {
      name    = "foo-pool",
      mode    = "transaction",
      size    = 10,
      db_name = "foo-database",
      user    = "foo-user"
    },
    {
      name    = "bar-pool"
      mode    = "transaction",
      size    = 10,
      db_name = "bar-database",
      user    = "bar-user"
    }
  ]

  create_firewall = true
  firewall_rules = [
    {
      type  = "k8s",
      value = module.kubernetes_cluster.kubernetes_cluster_id
    }
  ]

}
