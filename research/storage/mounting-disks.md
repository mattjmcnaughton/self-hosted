# mounting-disks

## Formatting the partition w/ ext4 filesystem

- `mkfs.ext4 block_device`
  - `block_device` is the device, w/ the partition => `/dev/sda1`.
- `mkdir /mount/point`
- `mount block_device /mount/point` (tmp))
- Add to fstab: `block_device /mount/path ext4 defaults 0 0`
  - Or can use ansible.
