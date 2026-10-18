## Terraform commands


```
# pre-requisites
aws configure
aws sts get-caller-identity


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
Plan: 12 to add, 0 to change, 0 to destroy.

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
Apply complete! Resources: 12 added, 0 changed, 0 destroyed.

Outputs:

frontend_url = "http://13.232.85.77"
health_check_urls = {
  "cart" = "http://13.232.85.77/svc/cart/health"
  "order" = "http://13.232.85.77/svc/order/health"
  "product" = "http://13.232.85.77/svc/product/health"
  "user" = "http://13.232.85.77/svc/user/health"
}
public_dns = "ec2-13-232-85-77.ap-south-1.compute.amazonaws.com"
public_ip = "13.232.85.77"


terraform destroy
........
aws_internet_gateway.igw: Destroying... [id=igw-0b8e0ef54ddee87bb]
aws_instance.app: Still destroying... [id=i-083cf7450dcde9939, 00m10s elapsed]
aws_internet_gateway.igw: Still destroying... [id=igw-0b8e0ef54ddee87bb, 00m10s elapsed]
aws_internet_gateway.igw: Destruction complete after 17s
aws_instance.app: Still destroying... [id=i-083cf7450dcde9939, 00m20s elapsed]
aws_instance.app: Destruction complete after 20s
aws_subnet.public: Destroying... [id=subnet-08bd522e1be79f093]
aws_security_group.app: Destroying... [id=sg-031460ab23f218b1c]
aws_subnet.public: Destruction complete after 0s
aws_security_group.app: Destruction complete after 0s
aws_vpc.main: Destroying... [id=vpc-05015cc462eea98fd]
aws_vpc.main: Destruction complete after 1s

Destroy complete! Resources: 12 destroyed.
```


