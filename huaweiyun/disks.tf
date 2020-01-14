resource "huaweicloud_blockstorage_volume_v2" "instance-sys-volume" {
  name              = "${var.hostname}-sys-volume"
  region            = "${var.region}"
  availability_zone = "${var.availability_zone}"
  image_id          = "${data.huaweicloud_images_image_v2.osimage.id}"
  volume_type       = "${var.root_volume.type}"
  size              = "${var.root_volume.size}"
}

resource "huaweicloud_blockstorage_volume_v2" "instance-data-volume" {
  count             = "${var.data_volume.enable == true ? 1 : 0}"
  name              = "${var.hostname}-data-volume"
  region            = "${var.region}"
  availability_zone = "${var.availability_zone}"
  volume_type       = "${var.data_volume.type}"
  size              = "${var.data_volume.size}"
}

resource "huaweicloud_compute_volume_attach_v2" "attach_data_volume" {
  count       = "${var.data_volume.enable == true ? 1 : 0}"
  instance_id = "${huaweicloud_compute_instance_v2.instance.id}"
  volume_id   = "${element(huaweicloud_blockstorage_volume_v2.instance-data-volume.*.id, count.index)}"
}