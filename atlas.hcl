variable "url" {
  type    = string
  default = "postgresql://postgres:postgres@db/postgres?sslmode=disable"
}

variable "pattern" {
  type    = string
  default = "tenant_%"
}

data "sql" "tenants" {
  url   = var.url
  query = "SELECT schema_name FROM information_schema.schemata WHERE schema_name LIKE $1;"
  args = [var.pattern]
}

env "local" {
  for_each = toset(data.sql.tenants.values)
  url = urlqueryset(var.url, "search_path", each.value)

  migration  {
    dir = "file://migrations"
  }
}
