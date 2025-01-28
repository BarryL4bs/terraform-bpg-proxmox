output "id" {
  value = proxmox_virtual_environment_user_token.pve_user_token.id
}

output "api_token" {
  value     = proxmox_virtual_environment_user_token.pve_user_token.value
  sensitive = true
}
