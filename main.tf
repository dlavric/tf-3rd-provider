resource "random_pet" "server" {
  length = 3
}

output "server" {
  value = random_pet.server.id
}