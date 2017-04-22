

1.terraform get
2.terraform init
3.terraform plan
4.terraform apply

Modules sub directory contains reusable module to build the stack.
Staks sub directory contains individual stacks to build infrastruture using module,each stack has main.tf file to invoke the each module.

.
|-- modules  ##
|   |-- s3_endpoint
|   |   |-- s3endpoint.tf
|   |   `-- variable.tf
|   |-- vpc
|   |   |-- variable.tf
|   |   |-- vpc.tf
|   |   `-- vpc.tf.org
|   |-- vpc_routes
|   |   |-- variable.tf
|   |   `-- vpc_routes.tf
|   `-- vpn_tunnel
|       |-- variable.tf
|       `-- vpn_tunnel.tf
|-- README.md
`-- stacks
    `-- vpc_build
        |-- main.tf
        `-- variable.tf
