#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:5c8a4441caf6f5bce884f56c507ffb8ec8729689 > /cache/recovery/last_install_recovery_status; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:33554432:cf50b38a051ec5a68181c6ee3b2aa4976e75e5e0 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:5c8a4441caf6f5bce884f56c507ffb8ec8729689 >> /cache/recovery/last_install_recovery_status && \
      echo "Installing new recovery image: succeeded" >> /cache/recovery/last_install_recovery_status || \
      echo "Installing new recovery image: failed" >> /cache/recovery/last_install_recovery_status
else
  echo "Recovery image already installed" >> /cache/recovery/last_install_recovery_status
fi
