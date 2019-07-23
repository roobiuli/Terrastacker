variable "services" {
    //type = "list"
    type = "list"
}

variable "data_directory" {
    type = "string"
    default = "/tmp/LocalstackTEMP/data"
}

variable "docker_host" {
    type = "string"
    default = "unix:///var/run/docker.sock"
}

variable "volume_container_path" {
    type = "string"
    default = "/tmp/localstack/"
}

variable "volume_host_path" {
    type = "string"
    default = "/tmp/LocalstackTEMP/"
}




variable "service_ports" {
    type = "map"
default = {
apigateway = 4567
kinesis = 4568
s3 = 4572
dynamodb = 4569
dynamodbstreams = 4570
elasticsearch = 4571
firehose = 4573
lambda = 4574
sns = 4575
sqs = 4576
redshift = 4577
es = 4578
ses = 4579
route53 = 4580
cloudformation = 4581
cloudwatch = 4582
ssm = 4583
secretsmanager = 4584
stepfunctions  = 4585
cloudwatch_logs = 4586
sts = 4592
iam = 4593
ec2 = 4597
}
 }
