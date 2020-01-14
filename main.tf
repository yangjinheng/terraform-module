module "instance1" {
  source            = "./huaweiyun"
  hostname          = "node1"
  admin_pass        = "123456"
  os                = "CentOS 7.6 64bit"
  flavor            = "t6.large.2"
  region            = "cn-north-1"
  availability_zone = "cn-north-1a"
  tenant_name       = "cn-north-1_lab"
  network = {
    vpc    = "vpc-omd"
    subnet = "vpc-omd-bak"
  }
  security_groups = ["Sys-default", "nomad-cluster"]
  root_volume = {
    type = "SAS"
    size = 100
  }
  data_volume = {
    enable = false
    type   = "SAS"
    size   = 100
  }
  metadata = {
    ansible_group           = "kubernetes consul registry"
    docker_registry         = "true"
    consul_node_name        = "node1"
    consul_node_role        = "server"
    consul_bootstrap_expect = "true"
  }
  commands = [
    "systemctl status sshd",
    "hostname"
  ]
}
