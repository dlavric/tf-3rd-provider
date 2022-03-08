terraform {
  required_providers {
    jetstream = {
      source  = "nats-io/jetstream"
      version = "0.0.5"
    }
  }
}

provider "random" {
  # Configuration options
}

