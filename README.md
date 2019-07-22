
## TerraStacker 

### Description 
Module for terraform to spin up a localstack container with default ports from localstack

#### Requiremnets
---
1. In order to function one should a working docker host (works on localhost)
2. Terraform Docker provider v 2.0
3. make
4. python (both Python 2.x and 3.x supported)
4. pip (python package manager)
5. npm (node.js package manager)
6. java/javac (Java 8 runtime environment and compiler)
7. mvn (Maven, the build system for Java)

For other dependencies look at: [LocalStack dependencies](https://github.com/localstack/localstack)

---


#### Install

In order to use the module one should define the TF module resource in it's main file

```
module "Terrastacker" {
    source = "git@github.com:roobiuli/Terrastacker.git"
    services = ["s3", "Dynamodb"]
}
```

Next apply the the configuration.

```
terraform apply
```

Verify container was created.

```
$ docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                                                                                                                                              NAMES
f5974646561e        987b7a40dddd        "docker-entrypoint.sh"   23 seconds ago      Up 21 seconds       0.0.0.0:4567-4586->4567-4586/tcp, 4587-4591/tcp, 0.0.0.0:4592-4593->4592-4593/tcp, 0.0.0.0:4597->4597/tcp, 0.0.0.0:8080->8080/tcp, 4594-4596/tcp   localstackcontainer
```



#### Usage 

Currently there are 4 variables that must be set in order to configure the module and make it functional.

* **Services** 
*List of strings which define aws services supported by localstack to enable on the locastack docker container.*
*Defined with "services" param. inside the module block.*

* **Docker_host**
*String param. which defaults to "unix:///var/run/docker.sock" if not set.*
*Defined with "docker_host" inside the module block.*

* **Volume_container_path**
*String param. which defaults to "/tmp/localstack/" if not set, it refers to the volume container path that*
*is attached to the docker container running localstack.*
*Defined with "volume_container_path" inside the module block.*

* **Volume_host_path**
*String param. which defaults to "/tmp/LocalstackTEMP/" if not set, it refers to the volume host path that*
*is attached to the docker container running localstack.*
*Defined with "volume_host_path" inside the module block.*

* **Data_directory*
*String param. that defines where data is hold, defaults to "/tmp/LocalstackTEMP/data" if not set.*
*Defined wih "data_directory" inside the module block.*



After crating container, veirfy that that S3 (for example ) service is running insde container:

First create a bucket

```
 $ aws --endpoint-url=http://localhost:4572 s3api create-bucket --bucket my-bucket --region eu-west-1
```

List s3 buckets

```
aws --endpoint-url=http://localhost:4572 s3 ls
2019-07-22 17:45:09 my-bucket
```


#### Known issues 
Currently Terraform docker provider does not support dynamic cration of Ports block for docker_container resource thus the localstack default ports for services are hardcoded

https://github.com/terraform-providers/terraform-provider-docker/issues/166


#### To be added
* Support for installing Java and all localstack requirements on the docker host.