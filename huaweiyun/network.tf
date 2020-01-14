data "huaweicloud_vpc_v1" "vpc" {
  name = "${var.network.vpc}"
}

data "huaweicloud_vpc_subnet_v1" "subnet" {
  name = "${var.network.subnet}"
}