packages = %w(
  mosquitto
  mosquitto-clients
)

packages.each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

services = %w(
  mosquitto
)

running_services = %w(
  mosquitto
)

services.each do |service|
  describe service(service) do
    it { should be_installed }
    it { should be_enabled }

    if running_services.include? service
      it { should be_running }
    end
  end
end

describe port(1883) do
  it { should be_listening }
  its("processes") { should include "mosquitto" }
end

config_files = %w(
  /etc/mosquitto/passwd
  /etc/mosquitto/conf.d/default.conf
)

config_files.each do |config_file|
  describe file(config_file) do
    it { should exist }
    its('type') { should eq :file }
    its('owner') { should eq 'root' }
    its('mode') { should cmp '0644' }
    its('size') { should > 0 }
  end
end

describe command('mosquitto_pub -m "message" -t "test-topic"') do
  its('stderr') { should include 'Connection error' }
end

describe command('mosquitto_pub -m "message" -t "test-topic" -u "test" -P "password"') do
  its('exit_status') { should eq 0 }
  its('stdout') { should eq "" }
  its('stderr') { should eq "" }
end
