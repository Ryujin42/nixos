  {...}:

{
  fileSystems."/mnt/data" = {
    device = "/dev/nvme1n1p1";
    fsType = "ntfs3";
    options = [ # If you don't have this options attribute, it'll default to "defaults" 
      # boot options for fstab. Search up fstab mount options you can use
      "uid=1000"   # replace with your actual UID from `id`
      "gid=1000"   # replace with your actual GID from `id`
      "rw"
      "users" # Allows any user to mount and unmount
      "nofail" # Prevent system from failing if this drive doesn't mount
      "exec" # Permit execution of binaries and other executable files
    ];
  };

  fileSystems."/mnt/windows" = {
    device = "/dev/nvme0n1p3";
    fsType = "ntfs3";
    options = [ # If you don't have this options attribute, it'll default to "defaults" 
      # boot options for fstab. Search up fstab mount options you can use
      "uid=1000"   # replace with your actual UID from `id`
      "gid=1000"   # replace with your actual GID from `id`
      "rw"
      "users" # Allows any user to mount and unmount
      "nofail" # Prevent system from failing if this drive doesn't mount
      "exec" # Permit execution of binaries and other executable files
      "umask=022"
    ];
  };
}
