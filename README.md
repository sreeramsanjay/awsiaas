

1.terraform get 

2.terraform init

3.terraform plan

4.terraform apply

Modules sub directory contains reusable module to build the stacks.
Staks sub directory contains individual stacks to build infrastruture using module,each stack has main.tf file to invoke the each module.


├── ansible-dcos-bootstrap
│   ├── dcos-install-bootstrap.yml
│   └── roles
│       └── dcos-bootstrap-install
│           ├── defaults
│           │   └── main.yml
│           ├── files
│           │   └── ip-detect
│           ├── tasks
│           │   └── main.yml
│           ├── templates
│           │   └── config.yaml.j2
│           ├── test
│           │   └── integration
│           │       └── default
│           │           ├── default.yml
│           │           └── serverspec
│           │               └── default_spec.rb
│           └── vars
|
├── dcos-post-install
│   ├── dcos-agent-attributes.sh
│   ├── docker-gc
│   ├── docker-gc.service
│   ├── docker-gc-setup.sh
│   └── docker-gc.timer
├── modules
│   ├── cisco
│   │   ├── appliance
│   │   │   ├── appliance.tf
│   │   │   └── variables.tf
│   │   ├── cisco-sg
│   │   │   ├── cisco_sg.tf
│   │   │   └── variables.tf
│   │   └── ec2-role
│   │       ├── ec2-role.tf
│   │       └── ec2-role.tf.org
│   ├── dcos_bs
│   │   └── ec2_instance
│   │       ├── ec2_instance.tf
│   │       └── variables.tf
│   ├── dcos_infra
│   │   ├── ec2_profile
│   │   │   ├── agent_ec2_profile.tf
│   │   │   ├── agent_policy.json
│   │   │   ├── bootstrap_ec2_profile.tf
│   │   │   ├── bs_policy.json
│   │   │   ├── master_ec2_profile.tf
│   │   │   ├── master_policy.json
│   │   │   └── variables.tf
│   │   ├── elb
│   │   │   ├── elb.tf
│   │   │   └── variable.tf
│   │   ├── s3_bucket
│   │   │   ├── s3_bucket_bs.tf
│   │   │   ├── s3_bucket_zk.tf
│   │   │   └── variables.tf
│   │   └── sg_dcos
│   │       ├── sg_bastion_host.tf
│   │       ├── sg_dcos.tf
│   │       ├── sg_mgmt_access.tf
│   │       └── variables.tf
│   ├── dcos_master
│   │   ├── auto_scaling
│   │   │   ├── auto_scaling.tf
│   │   │   └── variables.tf
│   │   ├── elb
│   │   │   ├── elb.tf
│   │   │   └── variable.tf
│   │   └── launch_config
│   │       ├── launch_config.tf
│   │       └── variables.tf
│   ├── dcos_priv
│   │   ├── auto_scaling
│   │   │   ├── auto_scaling.tf
│   │   │   └── variables.tf
│   │   └── launch_config
│   │       ├── launch_config.tf
│   │       └── variables.tf
│   ├── dcos_pub
│   │   ├── auto_scaling
│   │   │   ├── auto_scaling.tf
│   │   │   └── variables.tf
│   │   └── launch_config
│   │       ├── launch_config.tf
│   │       └── variables.tf
│   └── vpc
│       ├── s3_endpoint
│       │   ├── s3endpoint.tf
│       │   └── variable.tf
│       ├── vpc
│       │   ├── variable.tf
│       │   ├── vpc.tf
│       │   └── vpc.tf.org
│       ├── vpc_flow_logs
│       │   ├── flow_logs.tf
│       │   └── variables.tf
│       ├── vpc_routes
│       │   ├── variable.tf
│       │   └── vpc_routes.tf
│       └── vpn_tunnel
│           ├── variable.tf
│           └── vpn_tunnel.tf
├── README.md
└── stacks
    ├── bastion_host
    │   ├── main.tf
    │   ├── userdata.sh
    │   └── variables.tf
    ├── cisco
    │   ├── main.tf
    │   └── variables.tf
    ├── dcos_bs
    │   ├── main.tf
    │   ├── userdata.sh
    │   └── variables.tf
    ├── dcos_infra
    │   ├── bs_bucket_policy.json
    │   ├── main.tf
    │   └── variables.tf
    ├── dcos_master
    │   ├── main.tf
    │   ├── userdata.sh
    │   └── variables.tf
    ├── dcos_priv
    │   ├── main.tf
    │   ├── userdata.sh
    │   └── variables.tf
    ├── dcos_priv_dev
    │   ├── main.tf
    │   ├── userdata.sh
    │   └── variables.tf
    ├── dcos_priv_qa
    │   ├── main.tf
    │   ├── userdata.sh
    │   └── variables.tf
    ├── dcos_pub
    │   ├── main.tf
    │   ├── userdata.sh
    │   └── variables.tf
    └── vpc
        ├── main.tf
        ├── README.md
        └── variable.tf
