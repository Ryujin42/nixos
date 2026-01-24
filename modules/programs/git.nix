{...}:

{
  programs.git = {
    enable = true;
    settings.user = {
      name  = "ryujin";
      email = "ryujin.hector@gmail.com";
    };
    
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
