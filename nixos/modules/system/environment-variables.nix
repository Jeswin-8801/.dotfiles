{ pkgs, ... }:  {

  # Setup Env Variables
  environment.variables = {
    XDG_DATA_HOME = "$HOME/.local/share";
    PASSWORD_STORE_DIR = "$HOME/.local/share/password-store";
    EDITOR = "nvim";
    JDK_PATH = "${pkgs.jdk21}/";
    NODEJS_PATH = "${pkgs.nodePackages_latest.nodejs}/";
  };
}
