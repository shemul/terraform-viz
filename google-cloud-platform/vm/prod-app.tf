/**
 * @author Kief H. Shemul
 * @email theshemul@gmail.com
 * @create date 2020-06-03 22:22:28
 * @modify date 2020-06-03 22:22:28
 * @desc create a vm using tf.
 */


provider "google" {
  project = "data-cloud-staging-210306"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_compute_instance" "myvm" {
  name         = "terra-vm"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
      size  = 10
    }
  }
  tags = ["tf-app-1"]
  network_interface {
    network = google_compute_network.vpc_network.name
  }
}

resource "google_compute_network" "vpc_network" {
  name = "vpc-network"
}
resource "google_compute_firewall" "tf-myapp-fr" {
  name    = "tf-my-fr"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "tcp"
    ports    = [9090]
  }

}