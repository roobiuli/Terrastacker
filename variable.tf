variable "services" {
    type = "list"
}

variable "data_directory" {
    type = "string"
    default = "/tmp/localstack/data"
}

variable "docker_host" {
    type = "string"
    default = "unix:///var/run/docker.sock"
}
