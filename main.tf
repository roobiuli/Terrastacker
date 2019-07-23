resource "docker_image" "LocalStack" {
  name = "localstack/localstack"
  keep_locally = false
}

 // Making list of maches 
 data "null_data_source" "matches" {
   count = "${length(var.services)}"
   inputs = {
     value = "${lookup(var.service_ports, lower(replace(element(var.services, count.index), " ", "_")))}" 
   }
 }


resource "docker_container" "LocalStackContainer" {
  image = "${docker_image.LocalStack.latest}"
  name  = "localstackcontainer"

  env = ["SERVICES=${lower(join(",",formatlist("%s", var.services)))}", "DATA_DIR=${var.data_directory}", "PORT_WEB_UI=8080", "LAMBDA_EXECUTOR=docker", "DOCKER_HOST=unix:///var/run/docker.sock" ]

  volumes {
      container_path = "${var.volume_container_path}"
      host_path = "${var.volume_host_path}"
  }


// Terraform 0.12 for loop example.. at last
 dynamic "ports" {

     for_each = [for s in "${data.null_data_source.matches.*.outputs.value}": {
         internal = s
         external = s
     }]

     content {
         internal = ports.value.internal
         external = ports.value.external
         ip = "0.0.0.0"
         protocol = "tcp"
     }
 }
//
 
  //WEB GUI
  ports {
    internal = "8080"
    external = "8080"
    ip = "0.0.0.0"
    protocol = "tcp"
  }

}

