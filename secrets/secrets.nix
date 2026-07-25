let
  vmTest = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG/IfikldCcM6glbgq7vnm+TLfdYHjlY7uRjsahaUL0v";
  recovery = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIgUMXDS82IxVYcp82we7V9dQCQgErQVPZAeNa0Ve6AK";
in
{
  "ragenix-proof.age".publicKeys = [
    vmTest
    recovery
  ];
}
