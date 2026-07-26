let
  ctTest = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFDKqNN//l5NfDYZaWTTV9Gzaii/f+8BWswF2GgivqRz";
  recovery = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOCs9lcpi7XrhkQdnF0nurFVLb5Wx0/xMJ5TqucHE0ct";
in
{
  "ragenix-proof.age".publicKeys = [
    ctTest
    recovery
  ];
}
