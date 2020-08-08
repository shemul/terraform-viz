/**
 * @author Kief H. Shemul
 * @email theshemul@gmail.com
 * @create date 2020-06-03 22:22:28
 * @modify date 2020-06-03 22:22:28
 * @desc create a vm using tf.
 */

resource "google_compute_instance" "default" {
  project      = "<PROJECT_ID>"
  name         = "terraform"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}

# terraform init

# terraform plan

# terraform apply

# terraform plan

