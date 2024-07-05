#network

vpc_cidr_block            = "10.0.0.0/16"
public_subnet_cidr_blocks = ["10.0.1.0/24"]

availability_zones = ["us-east-1a"]

#EC2

region        = "us-east-1"
key_name      = "key_pair_aws_ibrahim"
ami           = "ami-04b70fa74e45c3917" #Canonical, Ubuntu, 24.04 LTS, amd64 noble image build on 2024-04-23
instance_type = "t2.large"