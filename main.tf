resource "digitalocean_database_cluster" "cluster" {
  name                 = var.cluster_name
  engine               = var.cluster_engine
  version              = var.cluster_version
  size                 = var.cluster_size
  region               = var.cluster_region
  node_count           = var.cluster_node_count
  private_network_uuid = var.cluster_private_network_uuid
  tags                 = var.cluster_tags
  eviction_policy      = var.redis_eviction_policy
  sql_mode             = var.mysql_sql_mode

  maintenance_window {
    hour = var.cluster_maintenance_hour
    day  = var.cluster_maintenance_day
  }
}

resource "digitalocean_database_db" "database" {
  for_each   = { for d in var.databases : d.name => d }
  cluster_id = digitalocean_database_cluster.cluster.id
  name       = each.value.name
}

resource "digitalocean_database_user" "user" {
  for_each   = { for u in var.users : u.name => u }
  cluster_id = digitalocean_database_cluster.cluster.id
  name       = each.value.name
}

resource "digitalocean_database_connection_pool" "connection_pool" {
  count = var.create_pools ? 1 : 0

  for_each   = { for p in var.pools : p.name => p }
  cluster_id = digitalocean_database_cluster.cluster.id
  name       = each.value.name
  mode       = each.value.mode
  size       = each.value.size
  db_name    = each.value.db_name
  user       = each.value.user
}

resource "digitalocean_database_firewall" "firewall" {
  count = var.create_firewall ? 1 : 0

  cluster_id = digitalocean_database_cluster.cluster.id
  dynamic "rule" {
    for_each = var.firewall_rules
    content {
      type  = rule.value.type
      value = rule.value.value
    }
  }

  depends_on = [digitalocean_database_cluster.cluster]
}
