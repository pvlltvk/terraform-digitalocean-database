
locals {
  database_cluster_id           = element(concat(digitalocean_database_cluster.cluster.*.id, [""]), 0)
  database_cluster_urn          = element(concat(digitalocean_database_cluster.cluster.*.urn, [""]), 0)
  database_cluster_host         = element(concat(digitalocean_database_cluster.cluster.*.host, [""]), 0)
  database_cluster_private_host = element(concat(digitalocean_database_cluster.cluster.*.private_host, [""]), 0)
  database_cluster_port         = element(concat(digitalocean_database_cluster.cluster.*.port, [""]), 0)
  database_cluster_uri          = element(concat(digitalocean_database_cluster.cluster.*.uri, [""]), 0)
  database_cluster_database     = element(concat(digitalocean_database_cluster.cluster.*.database, [""]), 0)
  database_cluster_user         = element(concat(digitalocean_database_cluster.cluster.*.user, [""]), 0)
  database_cluster_password     = element(concat(digitalocean_database_cluster.cluster.*.password, [""]), 0)
  connection_pool_id            = element(concat(digitalocean_database_connection_pool.connection_pool.*.id, [""]), 0)
  connection_pool_host          = element(concat(digitalocean_database_connection_pool.connection_pool.*.host, [""]), 0)
  connection_pool_private_host  = element(concat(digitalocean_database_connection_pool.connection_pool.*.private_host, [""]), 0)
  connection_pool_port          = element(concat(digitalocean_database_connection_pool.connection_pool.*.port, [""]), 0)
  connection_pool_uri           = element(concat(digitalocean_database_connection_pool.connection_pool.*.uri, [""]), 0)
  connection_pool_private_uri   = element(concat(digitalocean_database_connection_pool.connection_pool.*.private_uri, [""]), 0)
  connection_pool_password      = element(concat(digitalocean_database_connection_pool.connection_pool.*.password, [""]), 0)
  db_name                       = element(concat(digitalocean_database_db.database.*.password, [""]), 0)
  user_role                     = element(concat(digitalocean_database_user.user.*.role, [""]), 0)
  user_password                 = element(concat(digitalocean_database_user.user.*.password, [""]), 0)
  firewall_uuid                 = element(concat(digitalocean_database_firewall.firewall.*.uuid, [""]), 0)
  firewall_created_at           = element(concat(digitalocean_database_firewall.firewall.*.created_at, [""]), 0)
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
}

output "database_cluster_database" {
  description = "Name of the cluster's default database"
  value       = local.database_cluster_database
}

output "database_cluster_user" {
  description = "Username for the cluster's default user"
  value       = local.database_cluster_user
}

output "database_cluster_password" {
  description = "Password for the cluster's default user"
  value       = local.database_cluster_password
}

output "connection_pool_id" {
  description = "The ID of the database connection pool"
  value       = local.connection_pool_id
}

output "connection_pool_host" {
  description = "The hostname used to connect to the database connection pool"
  value       = local.connection_pool_host
}

output "connection_pool_private_host" {
  description = "Same as pool host, but only accessible from resources within the account and in the same region"
  value       = local.connection_pool_private_host
}

output "connection_pool_port" {
  description = "Network port that the database connection pool is listening on"
  value       = local.connection_pool_port
}

output "connection_pool_uri" {
  description = "The full URI for connecting to the database connection pool"
  value       = local.dconnection_pool_uri
}

output "connection_pool_private_uri" {
  description = "Same as pool uri, but only accessible from resources within the account and in the same region"
  value       = local.connection_pool_private_uri
}

output "connection_pool_password" {
  description = "Password for the connection pool's user"
  value       = local.connection_pool_password
}

output "db_name" {
  description = "The name for the database"
  value       = local.db_name
}

output "user_role" {
  description = "Role for the database user"
  value       = local.user_role
}

output "user_password" {
  description = "Password for the database user"
  value       = local.user_password
}

output "firewall_uuid" {
  description = "A unique identifier for the firewall rule"
  value       = local.firewall_uuid
}

output "firewall_created_at" {
  description = "Password for the cluster's default user"
  value       = local.firewall_created_at
}
