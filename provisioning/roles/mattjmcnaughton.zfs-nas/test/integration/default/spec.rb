control 'zfs-nas-01' do
  title 'Packages'
  impact 1.0

  packages = %w(
    zfs-dkms zfsutils-linux
  )

  packages.each do |package|
    describe package(package) do
      it { should be_installed }
    end
  end
end

control 'zfs-nas-02' do
  title 'ZFS'
  impact 1.0

  # We can't use the `zfs_pool` and `zfs_dataset` resources w/ inspec bc they
  # only work on FreeBSD.

  describe command("zpool get -Hp all tank") do
    its('exit_status') { should eq 0 }
  end

  describe command("zfs get -Hp all tank/test") do
    its('exit_status') { should eq 0 }
  end
end
