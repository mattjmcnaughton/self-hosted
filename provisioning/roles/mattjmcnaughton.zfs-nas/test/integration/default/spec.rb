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
