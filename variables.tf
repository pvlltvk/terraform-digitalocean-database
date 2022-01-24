variable "cluster_name" {
  description = "The name of the cluster"
}

variable "cluster_engine" {
  description = "Database engine used by the cluster (ex. pg for PostreSQL, mysql for MySQL, redis for Redis, or mongodb for MongoDB)"
}

variable "cluster_version" {
  description = "The version of the cluster"
}

variable "cluster_size" {
  description = "Database Droplet size associated with the cluster (ex. db-s-1vcpu-1gb)"
}

variable "cluster_region" {
  description = "DigitalOcean region where the cluster will reside"
}

variable "cluster_node_count" {
  description = "Number of nodes that will be included in the cluster"
}

variable "cluster_private_network_uuid" {
  description = "The ID of the VPC where the database cluster will be located"
}

variable "cluster_tags" {
  description = "A list of optional tags to add to the cluster"
  default     = []
}

variable "redis_eviction_policy" {
  description = "A string specifying the eviction policy for a Redis cluster. Valid values are: noeviction, allkeys_lru, allkeys_random, volatile_lru, volatile_random, or volatile_ttl"
}

variable "mysql_sql_mode" {
  description = "A comma separated string specifying the SQL modes for a MySQL cluster."
}

variable "cluster_maintenance_hour" {
  description = "The start hour in UTC of the maintenance window policy"
  default     = "02:00:00"
}

variable "cluster_maintenance_day" {
  description = "The day of the maintenance window policy"
  default     = "saturday"
}

variable "databases" {
  description = "A list of databases in the cluster"
  default     = []
}

variable "users" {
  description = "A list of users in the cluster"
  default     = []
}

variable "create_pools" {
  description = "Controls if pools should be created"
  type        = bool
  default     = false
}

variable "pools" {
  description = "A list of connection pools in the cluster"
  default     = []
}

variable "create_firewall" {
  description = "Controls if firewall should be created"
  type        = bool
  default     = false
}

variable "firewall_rules" {
  description = "List of firewall rules associated with the cluster"
  default     = []
}
