resource "huaweicloud_compute_instance_v2" "instance" {
  name              = "${var.hostname}"
  region            = "${var.region}"
  availability_zone = "${var.availability_zone}"
  flavor_name       = "${var.flavor}"
  admin_pass        = "${var.admin_pass}"
  security_groups   = "${var.security_groups}"

  block_device {
    uuid                  = "${huaweicloud_blockstorage_volume_v2.instance-sys-volume.id}"
    boot_index            = 0
    source_type           = "volume"
    destination_type      = "volume"
    delete_on_termination = true
  }

  network {
    uuid = "${data.huaweicloud_vpc_subnet_v1.subnet.id}"
  }

  metadata = "${var.metadata}"

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      host     = "${huaweicloud_compute_instance_v2.instance.access_ip_v4}"
      password = "${var.admin_pass}"
    }
    inline = "${var.commands}"
  }

}
