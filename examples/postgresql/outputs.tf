
output "database_cluster_id" {
  description = "The id of the database cluster"
  value       = module.cluster.database_cluster_id
}

output "database_cluster_urn" {
  description = "The uniform resource name of the database cluster"
  value       = module.cluster.database_cluster_urn
}

output "database_cluster_host" {
  description = "The hostname of the database cluster"
  value       = module.cluster.database_cluster_host
}

output "database_cluster_private_host" {
  description = "Same as host, but only accessible from resources within the account and in the same region"
  value       = module.cluster.database_cluster_private_host
}

output "database_cluster_port" {
  description = "Network port that the database cluster is listening on"
  value       = module.cluster.database_cluster_port
}

output "database_cluster_uri" {
  description = "The full URI for connecting to the database cluster"
  value       = module.cluster.database_cluster_uri
}

output "database_cluster_database" {
  description = "Name of the cluster's default database"
  value       = module.cluster.database_cluster_database
}

output "database_cluster_user" {
  description = "Username for the cluster's default user"
  value       = module.cluster.database_cluster_user
}

output "database_cluster_password" {
  description = "Password for the cluster's default user"
  value       = module.cluster.database_cluster_password
}

output "connection_pool_id" {
  description = "The ID of the database connection pool"
  value       = module.cluster.connection_pool_id
}

output "connection_pool_host" {
  description = "The hostname used to connect to the database connection pool"
  value       = module.cluster.connection_pool_host
}

output "connection_pool_private_host" {
  description = "Same as pool host, but only accessible from resources within the account and in the same region"
  value       = module.cluster.connection_pool_private_host
}

output "connection_pool_port" {
  description = "Network port that the database connection pool is listening on"
  value       = module.cluster.connection_pool_port
}

output "connection_pool_uri" {
  description = "The full URI for connecting to the database connection pool"
  value       = module.cluster.dconnection_pool_uri
}

output "connection_pool_private_uri" {
  description = "Same as pool uri, but only accessible from resources within the account and in the same region"
  value       = module.cluster.connection_pool_private_uri
}

output "connection_pool_password" {
  description = "Password for the connection pool's user"
  value       = module.cluster.connection_pool_password
}

output "db_name" {
  description = "The name for the database"
  value       = module.cluster.db_name
}

output "user_role" {
  description = "Role for the database user"
  value       = module.cluster.user_role
}

output "user_password" {
  description = "Password for the database user"
  value       = module.cluster.user_password
}

output "firewall_uuid" {
  description = "A unique identifier for the firewall rule"
  value       = module.cluster.firewall_uuid
}

output "firewall_created_at" {
  description = "Password for the cluster's default user"
  value       = module.cluster.firewall_created_at
}
