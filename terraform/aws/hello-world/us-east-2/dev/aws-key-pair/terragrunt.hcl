terraform {
  source = "../../../../../modules/aws_key_pair"
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "us-east-2"
}
EOF
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
    key_name   = "jasonjknsware"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDx9085Zw1UATW+nQ5z1aXYuPL7o98qSR+pOmdmL4woWORNZhDDIRTCMZnuQn5zu8YxGJB9tOfX69b7bnqULG/eOiCJI/pXeMPZ4WjoalyhTEEzdDbMPUZqs5R3gv3KFbkLCcOe7HEgrFQeMH/z9FmDpnX/CpabVaceXSFBeygPsB408a3Fc5r7vV0QANGvKCH2k/JhmT6VP1ANQqIqxWYO914UkDhasUCA0L5MZBEGq8wJ1d3JN7VUTLgw70bL0MVE3rfpf5e5iQ69i5Zw20gp/8HKFe+R/VgAVRYeDVUwB4O0rOmTrOwp72TSqD6vwjV+rR5r6MQMcMRJZ+R27GNw0OK6h2q1WVDzkfOuWrfTyKAtU2ribafi8mznlmD2g8IBZnplLtCT3IocsQWZ0RUveslAWaP8IJRlStivexYwF7JDrB5DU5mTlGKl0kNlEF0CZ2HDOvtj6UVnyOM2uJjkJQnt5ZSeGGeweaeNptYj+EjxnX9sFKy9CfTEhvjzinwDdzcN4M/M62SFIeMLqFSFKel5H6Uq0duCFgp0T7+tptdLhyNFi7ToYZHEYf1jwhW1uBboxz0WXiuiBByaObkcHymPz8qDPxOclia4ltozMe+IJKwcv1qFC7XYbinF2QHlbSWHAHe/iHb+VAzNsKbJtLclZN/0zlrDZ8UZVsho5w== jason@jknsware.com"
}