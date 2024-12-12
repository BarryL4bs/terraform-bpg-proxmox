terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.68.0"
    }
  }
  required_version = ">= 0.13"

}

provider "proxmox" {
  endpoint = var.endpoint
  username = var.username
  password = var.password

  # Habilite esta opção caso não possua um certificado válido.
  #insecure = true

  ssh {
    agent = true
  }
}
