control 'rasp-pi-base-01' do
  title 'Packages'
  impact 1.0

  packages = %w(
    curl git gnupg2 silversearcher-ag tmux vim
  )

  packages.each do |package|
    describe package(package) do
      it { should be_installed }
    end
  end
end

control 'rasp-pi-base-02' do
  title 'Configuration files'
  impact 1.0

  config_files = %w(
    .tmux.conf .vimrc
  )

  config_files.each do |config|
    describe file("/home/mattjmcnaughton/#{config}") do
      it { should exist }
      it { should be_owned_by 'mattjmcnaughton' }
      its('group') { should eq 'mattjmcnaughton' }
      its('mode') { should cmp '0664' }
    end
  end
end

control 'rasp-pi-base-03' do
  title 'Firewall'
  impact 1.0

  describe package("ufw") do
    it { should be_installed }
  end

  describe port(22) do
    it { should be_listening }
  end

  describe command('sudo ufw status verbose') do
    its('stdout') { should match (/Status: active/)}
    its('stdout') { should match (/22.*ALLOW/)}
    its('stdout') { should match (/Default: deny \(incoming\), allow \(outgoing\)/)}
  end
end

control 'rasp-pi-base-04' do
  title 'Automatic security upgrades'
  impact 1.0

  describe package("unattended-upgrades") do
    it { should be_installed }
  end
end
