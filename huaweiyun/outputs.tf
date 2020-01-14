output "name" {
  value = huaweicloud_compute_instance_v2.instance.name
}

output "access_ip_v4" {
  value = huaweicloud_compute_instance_v2.instance.access_ip_v4
}

output "metadata" {
  value = huaweicloud_compute_instance_v2.instance.metadata
}

output "admin_pass" {
  value = huaweicloud_compute_instance_v2.instance.admin_pass
}
