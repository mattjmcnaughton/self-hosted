describe docker_container('homeassistant') do
  it { should exist }
  it { should be_running }
  its('id') { should_not eq '' }
  its('image') { should include 'homeassistant' }
  its('ports') { should eq '' }  # No ports because set `host=net`.
end
