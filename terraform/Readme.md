## Terraform commands

```
# pre-requisites
aws configure
aws sts get-caller-identity
cd terraform
ssh-keygen -t rsa -b 4096 -f my-key



PS C:\Users\abhis\Harika\skilltest\E-CommerceStore\terraform> terraform init
Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Using previously-installed hashicorp/aws v5.100.0


Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
PS C:\Users\abhis\Harika\skilltest\E-CommerceStore\terraform> terraform validate
Success! The configuration is valid.

PS C:\Users\abhis\Harika\skilltest\E-CommerceStore\terraform> terraform plan
..............
Plan: 13 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + frontend_url      = (known after apply)
  + health_check_urls = {
      + cart    = (known after apply)
      + order   = (known after apply)
      + product = (known after apply)
      + user    = (known after apply)
    }
  + public_dns        = (known after apply)
  + public_ip         = (known after apply)

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if
you run "terraform apply" now.


terraform apply
........

Apply complete! Resources: 13 added, 0 changed, 0 destroyed.

Outputs:

frontend_url = "http://13.232.20.39"
health_check_urls = {
  "cart" = "http://13.232.20.39/svc/cart/health"
  "order" = "http://13.232.20.39/svc/order/health"
  "product" = "http://13.232.20.39/svc/product/health"
  "user" = "http://13.232.20.39/svc/user/health"
}
public_dns = "ec2-13-232-20-39.ap-south-1.compute.amazonaws.com"
public_ip = "13.232.20.39"


terraform destroy
........
PS C:\Users\abhis\Harika\skilltest\E-CommerceStore\terraform> terraform destroy
data.aws_availability_zones.available: Reading...
data.aws_ami.ubuntu: Reading...
aws_vpc.main: Refreshing state... [id=vpc-0eb4cea9997212570]
aws_key_pair.my_key: Refreshing state... [id=my-key]
data.aws_availability_zones.available: Read complete after 0s [id=ap-south-1]
data.aws_ami.ubuntu: Read complete after 0s [id=ami-0644c826df601fd4f]
aws_internet_gateway.igw: Refreshing state... [id=igw-0e5e1c2911f5d1f0c]
aws_security_group.app: Refreshing state... [id=sg-0b60eb069ef0aae5b]
aws_subnet.public: Refreshing state... [id=subnet-0d4261e71a9a269c4]
aws_route_table.public: Refreshing state... [id=rtb-0c3bd83c3cfd0f848]
aws_vpc_security_group_ingress_rule.internal_services: Refreshing state... [id=sgr-0a9430699cab7b200]
aws_vpc_security_group_egress_rule.all_out: Refreshing state... [id=sgr-03478dcb3959a84fc]
aws_vpc_security_group_ingress_rule.http: Refreshing state... [id=sgr-032881f3fd5baee27]
aws_vpc_security_group_ingress_rule.frontend_3000: Refreshing state... [id=sgr-07d6c3f685ac5a2c2]
aws_instance.app: Refreshing state... [id=i-0f5ecbd0456561536]
aws_vpc_security_group_ingress_rule.ssh[0]: Refreshing state... [id=sgr-05e811e82511dcf29]
aws_route_table_association.public: Refreshing state... [id=rtbassoc-0664f8d816dbfd835]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_instance.app will be destroyed
  - resource "aws_instance" "app" {
      - ami                                  = "ami-0644c826df601fd4f" -> null
      - arn                                  = "arn:aws:ec2:ap-south-1:129373676098:instance/i-0f5ecbd0456561536" -> null
      - associate_public_ip_address          = true -> null
      - availability_zone                    = "ap-south-1a" -> null
      - cpu_core_count                       = 1 -> null
      - cpu_threads_per_core                 = 2 -> null
      - disable_api_stop                     = false -> null
      - disable_api_termination              = false -> null
      - ebs_optimized                        = false -> null
      - get_password_data                    = false -> null
      - hibernation                          = false -> null
      - id                                   = "i-0f5ecbd0456561536" -> null
      - instance_initiated_shutdown_behavior = "stop" -> null
      - instance_state                       = "running" -> null
      - instance_type                        = "t3.small" -> null
      - ipv6_address_count                   = 0 -> null
      - ipv6_addresses                       = [] -> null
      - key_name                             = (sensitive value) -> null
      - monitoring                           = false -> null
      - placement_partition_number           = 0 -> null
      - primary_network_interface_id         = "eni-0fa13b7e2c376c53b" -> null
      - private_dns                          = "ip-10-0-1-196.ap-south-1.compute.internal" -> null
      - private_ip                           = "10.0.1.196" -> null
      - public_dns                           = "ec2-13-232-20-39.ap-south-1.compute.amazonaws.com" -> null
      - public_ip                            = "13.232.20.39" -> null
      - secondary_private_ips                = [] -> null
      - security_groups                      = [] -> null
      - source_dest_check                    = true -> null
      - subnet_id                            = "subnet-0d4261e71a9a269c4" -> null
      - tags                                 = {
          - "LaunchDate" = "2026-10-20"
          - "Name"       = "ecom-app-server"
          - "Project"    = "Assignment5"
        } -> null
      - tags_all                             = {
          - "LaunchDate" = "2026-10-20"
          - "Name"       = "ecom-app-server"
          - "Project"    = "Assignment5"
        } -> null
      - tenancy                              = "default" -> null
      - user_data                            = (sensitive value) -> null
      - user_data_replace_on_change          = true -> null
      - vpc_security_group_ids               = [
          - "sg-0b60eb069ef0aae5b",
        ] -> null
        # (7 unchanged attributes hidden)

      - capacity_reservation_specification {
          - capacity_reservation_preference = "open" -> null
        }

      - cpu_options {
          - core_count       = 1 -> null
          - threads_per_core = 2 -> null
            # (1 unchanged attribute hidden)
        }

      - credit_specification {
          - cpu_credits = "unlimited" -> null
        }

      - enclave_options {
          - enabled = false -> null
        }

      - maintenance_options {
          - auto_recovery = "default" -> null
        }

      - metadata_options {
          - http_endpoint               = "enabled" -> null
          - http_protocol_ipv6          = "disabled" -> null
          - http_put_response_hop_limit = 1 -> null
          - http_tokens                 = "optional" -> null
          - instance_metadata_tags      = "disabled" -> null
        }

      - private_dns_name_options {
          - enable_resource_name_dns_a_record    = false -> null
          - enable_resource_name_dns_aaaa_record = false -> null
          - hostname_type                        = "ip-name" -> null
        }

      - root_block_device {
          - delete_on_termination = true -> null
          - device_name           = "/dev/sda1" -> null
          - encrypted             = false -> null
          - iops                  = 3000 -> null
          - tags                  = {} -> null
          - tags_all              = {} -> null
          - throughput            = 125 -> null
          - volume_id             = "vol-0e0046b39156df433" -> null
          - volume_size           = 20 -> null
          - volume_type           = "gp3" -> null
            # (1 unchanged attribute hidden)
        }
    }

  # aws_internet_gateway.igw will be destroyed
  - resource "aws_internet_gateway" "igw" {
      - arn      = "arn:aws:ec2:ap-south-1:129373676098:internet-gateway/igw-0e5e1c2911f5d1f0c" -> null
      - id       = "igw-0e5e1c2911f5d1f0c" -> null
      - owner_id = "129373676098" -> null
      - tags     = {
          - "Name" = "ecom-igw"
        } -> null
      - tags_all = {
          - "Name" = "ecom-igw"
        } -> null
      - vpc_id   = "vpc-0eb4cea9997212570" -> null
    }

  # aws_key_pair.my_key will be destroyed
  - resource "aws_key_pair" "my_key" {
      - arn             = "arn:aws:ec2:ap-south-1:129373676098:key-pair/my-key" -> null
      - fingerprint     = "62:97:d9:fc:6a:82:cf:85:86:db:90:c3:e9:6e:e7:49" -> null
      - id              = "my-key" -> null
      - key_name        = (sensitive value) -> null
      - key_pair_id     = "key-0737a759400f7262c" -> null
      - key_type        = "rsa" -> null
      - public_key      = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDGcF5l8gbzD5AENe6MdTtimBT90bdrFzMut0Q0hMThSbsSjvqrP5GgwJ/lGedKgAhd1oZh2X2mA3eYFYhwYl5oZ/Amew1dY1zuYnhje/DqydlH44kx50BLmxMAJdOS0h3WyJcucIaAIguZuNoFV9xIe7QKU5/cFUSqFjRxrbQAa1RigjFkqU2LZ/g1WaqzMCMMQtf5P5WGI95ExpVEIYjHMvCSGS9Tsy6klMpIgqrBPIvUJzpS8yj2HjaNdt0ofiPq/bD/3jdT1dXJVai8ptnZMv5xHFAFHJhBEa7n3njlUXFlHE7W5Wq7fYuODBIxFLevuAx5UymTLd6/mOfLmiv77YXtQxcQcKA89Oub+8lmivyky59PrS6KdQ7H7gpC8S32TfvlwcrTP5tuEeouAHjh7o5xp4r6Z71HFY4nQyfOYrmtjtSp6p6BfcXc082h3OLr3LP6b9a8mXt2TcvtJh65dFxNJKE4tk3q+9ICqwZ79PyKk8bamFp1HUvnVUPE+3287hLg9q5ySg9ov8hcicyz2BTwTxAnIoASkhiPXFq/SEn0tamuD8JPfcjOMquSfuCLdDwwuNDEA1FqOBrAdXE0/NmkkLBHV5ZZYU5jVx8DDhLYoyPW1umTWOfDtmHVf6whbbp3pRf5ZIdZrGLlqEhvhWKlmWz2sOueS4m2S68uvQ== abhis@Bharathgift" -> null
      - tags            = {} -> null
      - tags_all        = {} -> null
        # (1 unchanged attribute hidden)
    }

  # aws_route_table.public will be destroyed
  - resource "aws_route_table" "public" {
      - arn              = "arn:aws:ec2:ap-south-1:129373676098:route-table/rtb-0c3bd83c3cfd0f848" -> null
      - id               = "rtb-0c3bd83c3cfd0f848" -> null
      - owner_id         = "129373676098" -> null
      - propagating_vgws = [] -> null
      - route            = [
          - {
              - cidr_block                 = "0.0.0.0/0"
              - gateway_id                 = "igw-0e5e1c2911f5d1f0c"
                # (11 unchanged attributes hidden)
            },
        ] -> null
      - tags             = {
          - "Name" = "ecom-public-rt"
        } -> null
      - tags_all         = {
          - "Name" = "ecom-public-rt"
        } -> null
      - vpc_id           = "vpc-0eb4cea9997212570" -> null
    }

  # aws_route_table_association.public will be destroyed
  - resource "aws_route_table_association" "public" {
      - id             = "rtbassoc-0664f8d816dbfd835" -> null
      - route_table_id = "rtb-0c3bd83c3cfd0f848" -> null
      - subnet_id      = "subnet-0d4261e71a9a269c4" -> null
        # (1 unchanged attribute hidden)
    }

  # aws_security_group.app will be destroyed
  - resource "aws_security_group" "app" {
      - arn                    = "arn:aws:ec2:ap-south-1:129373676098:security-group/sg-0b60eb069ef0aae5b" -> null
      - description            = "Public HTTP to frontend; internal service ports 3001-3004" -> null
      - egress                 = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - from_port        = 0
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "-1"
              - security_groups  = []
              - self             = false
              - to_port          = 0
                # (1 unchanged attribute hidden)
            },
        ] -> null
      - id                     = "sg-0b60eb069ef0aae5b" -> null
      - ingress                = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "Frontend alt port 3000"
              - from_port        = 3000
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 3000
            },
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "HTTP to frontend"
              - from_port        = 80
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 80
            },
          - {
              - cidr_blocks      = [
                  - "49.43.247.188/32",
                ]
              - description      = "SSH / EC2 Instance Connect"
              - from_port        = 22
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 22
            },
          - {
              - cidr_blocks      = []
              - description      = "Service-to-service 3001-3004 (members of this SG only)"
              - from_port        = 3001
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = true
              - to_port          = 3004
            },
        ] -> null
      - name                   = "ecom-app-sg" -> null
      - owner_id               = "129373676098" -> null
      - revoke_rules_on_delete = false -> null
      - tags                   = {
          - "Name" = "ecom-app-sg"
        } -> null
      - tags_all               = {
          - "Name" = "ecom-app-sg"
        } -> null
      - vpc_id                 = "vpc-0eb4cea9997212570" -> null
        # (1 unchanged attribute hidden)
    }

  # aws_subnet.public will be destroyed
  - resource "aws_subnet" "public" {
      - arn                                            = "arn:aws:ec2:ap-south-1:129373676098:subnet/subnet-0d4261e71a9a269c4" -> null
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "ap-south-1a" -> null
      - availability_zone_id                           = "aps1-az1" -> null
      - cidr_block                                     = "10.0.1.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-0d4261e71a9a269c4" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = true -> null
      - owner_id                                       = "129373676098" -> null
      - private_dns_hostname_type_on_launch            = "ip-name" -> null
      - tags                                           = {
          - "Name" = "ecom-public-subnet"
        } -> null
      - tags_all                                       = {
          - "Name" = "ecom-public-subnet"
        } -> null
      - vpc_id                                         = "vpc-0eb4cea9997212570" -> null
        # (4 unchanged attributes hidden)
    }

  # aws_vpc.main will be destroyed
  - resource "aws_vpc" "main" {
      - arn                                  = "arn:aws:ec2:ap-south-1:129373676098:vpc/vpc-0eb4cea9997212570" -> null
      - assign_generated_ipv6_cidr_block     = false -> null
      - cidr_block                           = "10.0.0.0/16" -> null
      - default_network_acl_id               = "acl-0d02315982e60a04a" -> null
      - default_route_table_id               = "rtb-097b45ea5885e40cc" -> null
      - default_security_group_id            = "sg-063ba2eb9de9ab385" -> null
      - dhcp_options_id                      = "dopt-0a00a53e4fcb72cc2" -> null
      - enable_dns_hostnames                 = true -> null
      - enable_dns_support                   = true -> null
      - enable_network_address_usage_metrics = false -> null
      - id                                   = "vpc-0eb4cea9997212570" -> null
      - instance_tenancy                     = "default" -> null
      - ipv6_netmask_length                  = 0 -> null
      - main_route_table_id                  = "rtb-097b45ea5885e40cc" -> null
      - owner_id                             = "129373676098" -> null
      - tags                                 = {
          - "Name" = "ecom-vpc"
        } -> null
      - tags_all                             = {
          - "Name" = "ecom-vpc"
        } -> null
        # (4 unchanged attributes hidden)
    }

  # aws_vpc_security_group_egress_rule.all_out will be destroyed
  - resource "aws_vpc_security_group_egress_rule" "all_out" {
      - arn                    = "arn:aws:ec2:ap-south-1:129373676098:security-group-rule/sgr-03478dcb3959a84fc" -> null
      - cidr_ipv4              = "0.0.0.0/0" -> null
      - id                     = "sgr-03478dcb3959a84fc" -> null
      - ip_protocol            = "-1" -> null
      - security_group_id      = "sg-0b60eb069ef0aae5b" -> null
      - security_group_rule_id = "sgr-03478dcb3959a84fc" -> null
      - tags_all               = {} -> null
    }

  # aws_vpc_security_group_ingress_rule.frontend_3000 will be destroyed
  - resource "aws_vpc_security_group_ingress_rule" "frontend_3000" {
      - arn                    = "arn:aws:ec2:ap-south-1:129373676098:security-group-rule/sgr-07d6c3f685ac5a2c2" -> null
      - cidr_ipv4              = "0.0.0.0/0" -> null
      - description            = "Frontend alt port 3000" -> null
      - from_port              = 3000 -> null
      - id                     = "sgr-07d6c3f685ac5a2c2" -> null
      - ip_protocol            = "tcp" -> null
      - security_group_id      = "sg-0b60eb069ef0aae5b" -> null
      - security_group_rule_id = "sgr-07d6c3f685ac5a2c2" -> null
      - tags_all               = {} -> null
      - to_port                = 3000 -> null
    }

  # aws_vpc_security_group_ingress_rule.http will be destroyed
  - resource "aws_vpc_security_group_ingress_rule" "http" {
      - arn                    = "arn:aws:ec2:ap-south-1:129373676098:security-group-rule/sgr-032881f3fd5baee27" -> null
      - cidr_ipv4              = "0.0.0.0/0" -> null
      - description            = "HTTP to frontend" -> null
      - from_port              = 80 -> null
      - id                     = "sgr-032881f3fd5baee27" -> null
      - ip_protocol            = "tcp" -> null
      - security_group_id      = "sg-0b60eb069ef0aae5b" -> null
      - security_group_rule_id = "sgr-032881f3fd5baee27" -> null
      - tags_all               = {} -> null
      - to_port                = 80 -> null
    }

  # aws_vpc_security_group_ingress_rule.internal_services will be destroyed
  - resource "aws_vpc_security_group_ingress_rule" "internal_services" {
      - arn                          = "arn:aws:ec2:ap-south-1:129373676098:security-group-rule/sgr-0a9430699cab7b200"-> null
      - description                  = "Service-to-service 3001-3004 (members of this SG only)" -> null
      - from_port                    = 3001 -> null
      - id                           = "sgr-0a9430699cab7b200" -> null
      - ip_protocol                  = "tcp" -> null
      - referenced_security_group_id = "sg-0b60eb069ef0aae5b" -> null
      - security_group_id            = "sg-0b60eb069ef0aae5b" -> null
      - security_group_rule_id       = "sgr-0a9430699cab7b200" -> null
      - tags_all                     = {} -> null
      - to_port                      = 3004 -> null
    }

  # aws_vpc_security_group_ingress_rule.ssh[0] will be destroyed
  - resource "aws_vpc_security_group_ingress_rule" "ssh" {
      - arn                    = "arn:aws:ec2:ap-south-1:129373676098:security-group-rule/sgr-05e811e82511dcf29" -> null
      - cidr_ipv4              = "49.43.247.188/32" -> null
      - description            = "SSH / EC2 Instance Connect" -> null
      - from_port              = 22 -> null
      - id                     = "sgr-05e811e82511dcf29" -> null
      - ip_protocol            = "tcp" -> null
      - security_group_id      = "sg-0b60eb069ef0aae5b" -> null
      - security_group_rule_id = "sgr-05e811e82511dcf29" -> null
      - tags_all               = {} -> null
      - to_port                = 22 -> null
    }

Plan: 0 to add, 0 to change, 13 to destroy.

Changes to Outputs:
  - frontend_url      = "http://13.232.20.39" -> null
  - health_check_urls = {
      - cart    = "http://13.232.20.39/svc/cart/health"
      - order   = "http://13.232.20.39/svc/order/health"
      - product = "http://13.232.20.39/svc/product/health"
      - user    = "http://13.232.20.39/svc/user/health"
    } -> null
  - public_dns        = "ec2-13-232-20-39.ap-south-1.compute.amazonaws.com" -> null
  - public_ip         = "13.232.20.39" -> null

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_vpc_security_group_ingress_rule.frontend_3000: Destroying... [id=sgr-07d6c3f685ac5a2c2]
aws_route_table_association.public: Destroying... [id=rtbassoc-0664f8d816dbfd835]
aws_vpc_security_group_egress_rule.all_out: Destroying... [id=sgr-03478dcb3959a84fc]
aws_vpc_security_group_ingress_rule.internal_services: Destroying... [id=sgr-0a9430699cab7b200]
aws_vpc_security_group_ingress_rule.ssh[0]: Destroying... [id=sgr-05e811e82511dcf29]
aws_vpc_security_group_ingress_rule.http: Destroying... [id=sgr-032881f3fd5baee27]
aws_instance.app: Destroying... [id=i-0f5ecbd0456561536]
aws_route_table_association.public: Destruction complete after 0s
aws_route_table.public: Destroying... [id=rtb-0c3bd83c3cfd0f848]
aws_vpc_security_group_ingress_rule.frontend_3000: Destruction complete after 0s
aws_vpc_security_group_ingress_rule.ssh[0]: Destruction complete after 0s
aws_vpc_security_group_egress_rule.all_out: Destruction complete after 0s
aws_vpc_security_group_ingress_rule.http: Destruction complete after 0s
aws_vpc_security_group_ingress_rule.internal_services: Destruction complete after 0s
aws_route_table.public: Destruction complete after 1s
aws_internet_gateway.igw: Destroying... [id=igw-0e5e1c2911f5d1f0c]
aws_instance.app: Still destroying... [id=i-0f5ecbd0456561536, 00m10s elapsed]
aws_internet_gateway.igw: Still destroying... [id=igw-0e5e1c2911f5d1f0c, 00m10s elapsed]
aws_instance.app: Still destroying... [id=i-0f5ecbd0456561536, 00m20s elapsed]
aws_internet_gateway.igw: Still destroying... [id=igw-0e5e1c2911f5d1f0c, 00m20s elapsed]
aws_internet_gateway.igw: Destruction complete after 27s
aws_instance.app: Still destroying... [id=i-0f5ecbd0456561536, 00m30s elapsed]
aws_instance.app: Destruction complete after 31s
aws_key_pair.my_key: Destroying... [id=my-key]
aws_subnet.public: Destroying... [id=subnet-0d4261e71a9a269c4]
aws_security_group.app: Destroying... [id=sg-0b60eb069ef0aae5b]
aws_key_pair.my_key: Destruction complete after 0s
aws_subnet.public: Destruction complete after 0s
aws_security_group.app: Destruction complete after 0s
aws_vpc.main: Destroying... [id=vpc-0eb4cea9997212570]
aws_vpc.main: Destruction complete after 1s

Destroy complete! Resources: 13 destroyed.
PS C:\Users\abhis\Harika\skilltest\E-CommerceStore\terraform> 
```

> <img width="1857" height="384" alt="image" src="https://github.com/user-attachments/assets/e5b93dda-39c0-4f8c-821b-f10270a8188c" />

> <img width="1502" height="958" alt="image" src="https://github.com/user-attachments/assets/78107120-a15a-4a92-917e-a8969edfb29b" />

> <img width="1739" height="660" alt="image" src="https://github.com/user-attachments/assets/9bd8de8f-5a7e-4f7a-bfc7-837993d2c16b" />

> <img width="1706" height="972" alt="image" src="https://github.com/user-attachments/assets/415ea3c4-b6a2-4ff5-9385-d2948eff204a" />

> <img width="1045" height="919" alt="image" src="https://github.com/user-attachments/assets/bd1fe8f9-ae4c-4911-a61f-68eef129ee0d" />




