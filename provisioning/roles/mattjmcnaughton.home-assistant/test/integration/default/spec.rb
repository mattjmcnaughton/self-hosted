describe docker_container('homeassistant') do
  it { should exist }
  it { should be_running }
  its('id') { should_not eq '' }
  its('image') { should include 'homeassistant' }
  its('ports') { should eq '' }  # No ports because set `host=net`.
end

describe service('nginx') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe http('http://localhost/', ssl_verify: false) do
  its('status') { should cmp 301 }
end

describe http('https://localhost/', ssl_verify: false) do
  its('status') { should cmp 302 }
end
