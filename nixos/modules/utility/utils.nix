{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mold
    gcc
    clang
    lld
    lldb
    musl
    jdk21
    dioxus-cli
    trunk
  ];
}
