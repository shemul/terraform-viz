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
  network_interface {
    network = "default"
    access_config {}
  }
}