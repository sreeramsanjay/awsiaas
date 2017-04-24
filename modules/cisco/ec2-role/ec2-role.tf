resource "aws_iam_role" "cisco_iam_role" {
   name = "cisco_csr_iam_role"
   assume_role_policy = <<EOF
   {
     "Version": "2012-10-17",
     "Statement": [
       {
         "Action": "sts:AssumeRole",
         "Principal": {
           "Service": "ec2.amazonaws.com"
         },
         "Effect": "Allow",
         "Sid": ""
       }
     ]
   }
  EOF
}

resource "aws_iam_instance_profile" "cisco_instance_profile" {
  name = "cisco_csr_instance_profile"
  roles = ["cisco_csr_iam_role"]
}

resource "aws_iam_policy" "cisco_iam_policy" {
name = "cisco_csr_iam_role_policy"
policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:AssociateRouteTable ",
                "ec2:CreateRoute",
                "ec2:CreateRouteTable",
                "ec2:DeleteRoute",
                "ec2:DeleteRouteTable",
                "ec2:DescribeRouteTables",
                "ec2:DescribeVpcs",
                "ec2:ReplaceRoute",
                "ec2:DisassociateRouteTable ",
                "ec2: ReplaceRouteTableAssociation "
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_policy_attachment" "cisco_csr_policy" {
  name       = "cisco_csr_policy_attachment"
  roles      = ["${aws_iam_role.cisco_iam_role.name}"]
  policy_arn = "${aws_iam_policy.cisco_iam_policy.arn}"
}

output "cisco_csr_instance_profile" {
  value = "${aws_iam_instance_profile.cisco_instance_profile.name}"
}
