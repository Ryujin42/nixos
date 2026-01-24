{...}:

{
  programs.git = {
    enable = true;
    settings.users = {
      name  = "ryujin";
      email = "ryujin.hector@gmail.com";
    };
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
