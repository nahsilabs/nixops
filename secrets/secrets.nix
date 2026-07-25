let
  vmTest = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINOTa+mggzTikbU3K87Ncrd3E5tVC2U8MJ2js7ysNl4g";
  recovery = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIgUMXDS82IxVYcp82we7V9dQCQgErQVPZAeNa0Ve6AK";
in
{
  "ragenix-proof.age".publicKeys = [
    vmTest
    recovery
  ];
}
