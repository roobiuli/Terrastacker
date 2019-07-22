resource "docker_image" "LocalStack" {
  name = "localstack/localstack"
  keep_locally = false
}

 // Making list of maches 
//  data "null_data_source" "matches" {
//    count = "${length(var.services)}"
//    inputs {
//      value = "${lookup(var.service_ports, lower(replace(element(var.services, count.index), " ", "_")))}" 
//    }
//  }


resource "docker_container" "LocalStackContainer" {
  image = "${docker_image.LocalStack.latest}"
  name  = "localstackcontainer"

  env = ["SERVICES=${lower(join(",",formatlist("%s", var.services)))}", "DATA_DIR=${var.data_directory}", "PORT_WEB_UI=8080", "LAMBDA_EXECUTOR=docker", "DOCKER_HOST=unix:///var/run/docker.sock" ]

  volumes {
      container_path = "/tmp/localstack/"
      host_path = "/tmp/LocalstackTEMP/"
  }

  // All api Ports (To be changed with iterator per service in future version)

  //ports {
   //  count = "${length(data.null_data_source.matches.*.outputs.value)}"
   // Do yo problem in peovider to be more precise prots block not supporting count I have to hardcode all the ports ...
   // https://github.com/terraform-providers/terraform-provider-docker/issues/166

  //  internal = "${element(data.null_data_source.matches.*.outputs.value, count.index)}"
  //  external = "${element(data.null_data_source.matches.*.outputs.value, count.index)}"
   //ip = "0.0.0.0"
  // protocol = "tcp"
 // }
 
 ports { 
    internal = 4567 
    external = 4567 
    ip = "0.0.0.0" 
    protocol = "tcp" 
    }
ports { 
    internal = 4568 
    external = 4568 
    ip = "0.0.0.0" 
    protocol = "tcp" 
    }
ports { 
    internal = 4572 
    external = 4572 
    ip = "0.0.0.0" 
    protocol = "tcp" 
    }
ports { 
    internal = 4569 
    external = 4569 
    ip = "0.0.0.0" 
    protocol = "tcp" 
    }
ports { 
    internal = 4570 
    external = 4570 
    ip = "0.0.0.0" 
    protocol = "tcp" 
    }
ports { 
    internal = 4571 
    external = 4571 
    ip = "0.0.0.0" 
    protocol = "tcp" 
    }
ports { 
    internal = 4573 
    external = 4573 
    ip = "0.0.0.0" 
    protocol = "tcp" 
    }
ports { 
    internal = 4574 
    external = 4574 
    ip = "0.0.0.0" 
    protocol = "tcp" 
    }
ports { 
    internal = 4575 
    external = 4575 
    ip = "0.0.0.0" 
    protocol = "tcp" 
    }
ports { 
    internal = 4576 
    external = 4576 
    ip = "0.0.0.0" 
    protocol = "tcp" 
    }
ports { 
    internal = 4577 
    external = 4577 
    ip = "0.0.0.0" 
    protocol = "tcp" 
    }
ports { 
    internal = 4578 
    external = 4578 
    ip = "0.0.0.0" 
    protocol = "tcp" 
    }
ports { 
    internal = 4579 
    external = 4579 
    ip = "0.0.0.0" 
    protocol = "tcp" 
    }
ports { 
    internal = 4580 
    external = 4580 
    ip = "0.0.0.0" 
    protocol = "tcp" 
    }
ports { 
    internal = 4581 
    external = 4581 
    ip = "0.0.0.0" 
    protocol = "tcp" 
    }
ports { 
    internal = 4582 
    external = 4582 
    ip = "0.0.0.0" 
    protocol = "tcp" 
    }
ports { 
    internal = 4583 
    external = 4583 
    ip = "0.0.0.0" 
    protocol = "tcp" 
    }
ports { 
    internal = 4584 
    external = 4584 
    ip = "0.0.0.0" 
    protocol = "tcp" 
    }
ports { 
    internal = 4585 
    external = 4585 
    ip = "0.0.0.0" 
    protocol = "tcp" 
    }
ports { 
    internal = 4586 
    external = 4586 
    ip = "0.0.0.0" 
    protocol = "tcp" 
    }
ports { 
    internal = 4592 
    external = 4592 
    ip = "0.0.0.0" 
    protocol = "tcp" 
    }
ports { 
    internal = 4593 
    external = 4593 
    ip = "0.0.0.0" 
    protocol = "tcp" 
    }
ports { 
    internal = 4597 
    external = 4597 
    ip = "0.0.0.0" 
    protocol = "tcp" 
    }
 
 
  //WEB GUI
  ports {
    internal = "8080"
    external = "8080"
    ip = "0.0.0.0"
    protocol = "tcp"
  }

}

