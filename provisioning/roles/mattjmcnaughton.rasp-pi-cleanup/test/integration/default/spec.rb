control 'rasp-pi-clean-up-01' do
  title 'Users'
  impact 1.0

  describe user('ubuntu') do
    it { should_not exist }
  end
end

control 'rasp-pi-clean-up-02' do
  title 'SSH Config'
  impact 1.0

  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /PermitEmptyPasswords no/ }
    its('content') { should match /PermitRootLogin no/ }
    its('content') { should match /PasswordAuthentication no/ }
  end
end
