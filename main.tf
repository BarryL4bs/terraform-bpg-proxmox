resource "proxmox_virtual_environment_role" "terraform" {
  role_id = "BPG-Terraform"

  privileges = [
    "Datastore.Allocate", "Datastore.AllocateSpace", "Datastore.AllocateTemplate", "Datastore.Audit", "Pool.Allocate", "Sys.Audit", "Sys.Console", "Sys.Modify", "SDN.Use", "VM.Allocate", "VM.Audit", "VM.Clone", "VM.Config.CDROM", "VM.Config.Cloudinit", "VM.Config.CPU", "VM.Config.Disk", "VM.Config.HWType", "VM.Config.Memory", "VM.Config.Network", "VM.Config.Options", "VM.Migrate", "VM.Monitor", "VM.PowerMgmt", "User.Modify",
  ]
}

resource "proxmox_virtual_environment_user" "pve_user" {
  acl {
    path      = "/"
    propagate = true
    role_id   = proxmox_virtual_environment_role.terraform.role_id
  }

  comment = "Managed by Terraform"
  user_id = "proxmox-post@pve"

  depends_on = [proxmox_virtual_environment_role.terraform]
}

resource "proxmox_virtual_environment_user_token" "pve_user_token" {
  comment               = "Managed by Terraform"
  expiration_date       = "2024-12-10T00:30:00Z" # Altere a data de expiração do token, ou comente esta linha se não quiser que o token expire.
  privileges_separation = false
  token_name            = "terraform"
  user_id               = proxmox_virtual_environment_user.pve_user.user_id

  depends_on = [proxmox_virtual_environment_user.pve_user]
}