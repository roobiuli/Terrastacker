resource "docker_image" "LocalStack" {
  name = "localstack/localstack"
}

// resrouce "docker_volume" "DataHolder" {
//     name = "LocalStackDataHolder"
// }

resource "docker_container" "LocalStackContainer" {
  image = "${docker_image.LocalStack.latest}"
  name  = "localstackcontainer"

  env = ["ports=4567-4584:4567-4584", "SERVICES=${var.services}", "DATA_DIR=${var.data_directory}", "PORT_WEB_UI=8080", "LAMBDA_EXECUTOR=docker", "DOCKER_HOST=unix:///var/run/docker.sock" ]
  
  volumes {
      //volume_name = "${docker_volume.DataHolder.name}"
      container_path = "/tmp/localstack"
      host_path = "/tmp/LocalstackTEMP"
  }
}

