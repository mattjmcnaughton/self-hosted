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

  describe command("zfs get -Hp all tank") do
    its('exit_status') { should eq 0 }
    its('stdout') { should match (/type\tfilesystem/) }
    its('stdout') { should match (/encryption\toff/) }
    its('stdout') { should match (/mounted\tyes/) }
  end

  describe command("zfs get -Hp all tank/test") do
    its('exit_status') { should eq 0 }
    its('stdout') { should match (/type\tfilesystem/) }
    its('stdout') { should match (/encryption\toff/) }
    its('stdout') { should match (/mounted\tyes/) }
  end

  describe command("zfs get -Hp all tank/test-encrypted") do
    its('exit_status') { should eq 0 }
    its('stdout') { should match (/type\tfilesystem/) }
    its('stdout') { should match (/encryption\taes-256-ccm/) }
    its('stdout') { should match (/keyformat\tpassphrase/) }
    its('stdout') { should match (/mounted\tyes/) }
  end
end

control 'zfs-nas-03' do
  title 'Mounting'
  impact 1.0

  describe directory('/tank/test/sample_dir') do
    it { should exist }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'mattjmcnaughton' }
  end
end
