describe docker_container('homeassistant') do
  it { should exist }
  it { should be_running }
  its('id') { should_not eq '' }
  its('image') { should include 'homeassistant' }

  # Need more tests
end

describe service('nginx') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end
