control 'rasp-pi-from-scratch-01' do
  title 'Hostname'
  impact 1.0

  describe sys_info do
    its('hostname') { should eq 'test-hostname' }
  end
end

control 'rasp-pi-from-scratch-02' do
  title 'Networking'
  impact 1.0

  describe file('/etc/netplan/99-config.yaml') do
    its('content') { should match /test-ssid/ }
    its('content') { should match /test-password/ }
    it { should be_owned_by 'root' }
    its('group') { should eq 'root' }
    its('mode') { should cmp '0644' }
  end

  describe package('netplan.io') do
    it { should be_installed }
  end
end

control 'rasp-pi-from-scratch-03' do
  title 'OpenSSH'
  impact 1.0

  describe package('openssh-server') do
    it { should be_installed }
  end

  describe port(22) do
    it { should be_listening }
    its('processes') { should include 'sshd' }
  end
end

control 'rasp-pi-from-scratch-04' do
  title 'User'
  impact 1.0

  describe user('test_user') do
    it { should exist }
    its('uid') { should eq 1001 }
    its('groups') { should include 'sudo' }
    its('shell') { should eq '/usr/bin/bash' }
  end

  describe file('/home/test_user/.ssh/authorized_keys') do
    it { should exist }
    it { should be_owned_by 'test_user' }
    its('group') { should eq 'test_user' }
    its('mode') { should cmp '0600' }
  end
end

control 'rasp-pi-from-scratch-05' do
  title 'Filesystem'
  impact 1.0

  describe filesystem('/opt/test') do
    its('type') { should cmp 'ext4' }
  end
end
