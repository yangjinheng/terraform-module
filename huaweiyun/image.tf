// "rhel7.6"
// "CentOS 7.6 64bit"
// "Ubuntu 16.04 server 64bit"
// "Ubuntu 18.04 server 64bit"

data "huaweicloud_images_image_v2" "osimage" {
  name        = "${var.os}"
  most_recent = true
}