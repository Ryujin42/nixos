  {...}:

{
  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-uuid/e26b8796-2335-4966-b6fe-c0ff53f33a46";
    fsType = "ext4";
    options = [
      "rw"
      "nofail"
    ];
  };

  fileSystems."/mnt/windows" = {
    device = "/dev/disk/by-uuid/0CDE2660DE2641F6";
    fsType = "ntfs3";
    options = [
      "uid=1000"
      "gid=1000"
      "rw"
      "users"
      "nofail"
      "exec"
      "umask=022"
    ];
  };
}
