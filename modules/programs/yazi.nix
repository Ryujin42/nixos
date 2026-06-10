{...}:

{
  programs.yazi = {
    enable = true;

    shellWrapperName = "yy";

    settings = {
      tasks = {
        image_alloc = 0;
      };
    };
  };
}
