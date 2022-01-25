
locals {
  database_cluster_id               = element(concat(digitalocean_database_cluster.cluster.*.id, [""]), 0)
  database_cluster_urn              = element(concat(digitalocean_database_cluster.cluster.*.urn, [""]), 0)
  database_cluster_host             = element(concat(digitalocean_database_cluster.cluster.*.host, [""]), 0)
  database_cluster_private_host     = element(concat(digitalocean_database_cluster.cluster.*.private_host, [""]), 0)
  database_cluster_port             = element(concat(digitalocean_database_cluster.cluster.*.port, [""]), 0)
  database_cluster_uri              = element(concat(digitalocean_database_cluster.cluster.*.uri, [""]), 0)
  database_cluster_default_database = element(concat(digitalocean_database_cluster.cluster.*.database, [""]), 0)
  database_cluster_default_user     = element(concat(digitalocean_database_cluster.cluster.*.user, [""]), 0)
  database_cluster_default_password = element(concat(digitalocean_database_cluster.cluster.*.password, [""]), 0)
  database_firewall_id              = element(concat(digitalocean_database_firewall.firewall.*.id, [""]), 0)
}

output "database_cluster_id" {
  description = "The id of the database cluster"
  value       = local.database_cluster_id
}

output "database_cluster_urn" {
  description = "The uniform resource name of the database cluster"
  value       = local.database_cluster_urn
}

output "database_cluster_host" {
  description = "The hostname of the database cluster"
  value       = local.database_cluster_host
}

output "database_cluster_private_host" {
  description = "Same as host, but only accessible from resources within the account and in the same region"
  value       = local.database_cluster_private_host
}

output "database_cluster_port" {
  description = "Network port that the database cluster is listening on"
  value       = local.database_cluster_port
}

output "database_cluster_uri" {
  description = "The full URI for connecting to the database cluster"
  value       = local.database_cluster_uri
  sensitive   = true
}

output "database_cluster_default_database" {
  description = "Name of the cluster's default database"
  value       = local.database_cluster_default_database
}

output "database_cluster_default_user" {
  description = "Username for the cluster's default user"
  value       = local.database_cluster_default_user
}

output "database_cluster_default_password" {
  description = "Password for the cluster's default user"
  value       = local.database_cluster_default_password
  sensitive   = true
}

output "connection_pool_id" {
  description = "The ID of the database connection pool"
  value = {
    for k, pool in digitalocean_database_connection_pool.connection_pool : k => pool.id
  }
}

output "connection_pool_host" {
  description = "The hostname used to connect to the database connection pool"
  value = {
    for k, pool in digitalocean_database_connection_pool.connection_pool : k => pool.host
  }
}

output "connection_pool_private_host" {
  description = "Same as pool host, but only accessible from resources within the account and in the same region"
  value = {
    for k, pool in digitalocean_database_connection_pool.connection_pool : k => pool.private_host
  }
}

output "connection_pool_port" {
  description = "Network port that the database connection pool is listening on"
  value = {
    for k, pool in digitalocean_database_connection_pool.connection_pool : k => pool.port
  }
}

output "connection_pool_uri" {
  description = "The full URI for connecting to the database connection pool"
  value = {
    for k, pool in digitalocean_database_connection_pool.connection_pool : k => pool.uri
  }
  sensitive = true
}

output "connection_pool_private_uri" {
  description = "Same as pool uri, but only accessible from resources within the account and in the same region"
  value = {
    for k, pool in digitalocean_database_connection_pool.connection_pool : k => pool.private_uri
  }
  sensitive = true
}

output "connection_pool_password" {
  description = "Password for the connection pool's user"
  value = {
    for k, pool in digitalocean_database_connection_pool.connection_pool : k => pool.password
  }
  sensitive = true
}

output "db_name" {
  description = "The name for the database"
  value = [
    for db in digitalocean_database_db.database : db.name
  ]
}

output "user_role" {
  description = "Role for the database user"
  value = {
    for k, user in digitalocean_database_user.user : k => user.role
  }
}

output "user_password" {
  description = "Password for the database user"
  value = {
    for k, user in digitalocean_database_user.user : k => user.password
  }
  sensitive = true
}

output "database_firewall_id" {
  description = "A unique identifier for the firewall"
  value       = local.database_firewall_id
}

output "database_firewall_rule" {
  description = "A map with rule's uuid, type, value and created_at params"
  value = [
    for r in digitalocean_database_firewall.firewall.*.rule : r
  ]
}
