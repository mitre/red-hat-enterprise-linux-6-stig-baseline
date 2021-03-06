control "V-38524" do
  title "The system must not accept ICMPv4 redirect packets on any interface."
  desc  "Accepting ICMP redirects has few legitimate uses. It should be
disabled unless it is absolutely required."
  impact 0.5
  tag "gtitle": "SRG-OS-999999"
  tag "gid": "V-38524"
  tag "rid": "SV-50325r2_rule"
  tag "stig_id": "RHEL-06-000084"
  tag "fix_id": "F-43472r1_fix"
  tag "cci": ["CCI-000366"]
  tag "nist": ["CM-6 b", "Rev_4"]
  tag "false_negatives": nil
  tag "false_positives": nil
  tag "documentable": false
  tag "mitigations": nil
  tag "severity_override_guidance": false
  tag "potential_impacts": nil
  tag "third_party_tools": nil
  tag "mitigation_controls": nil
  tag "responsibility": nil
  tag "ia_controls": nil
  tag "check": "The status of the \"net.ipv4.conf.all.accept_redirects\" kernel
parameter can be queried by running the following command:

$ sysctl net.ipv4.conf.all.accept_redirects

The output of the command should indicate a value of \"0\". If this value is
not the default value, investigate how it could have been adjusted at runtime,
and verify it is not set improperly in \"/etc/sysctl.conf\".

$ grep net.ipv4.conf.all.accept_redirects /etc/sysctl.conf

If the correct value is not returned, this is a finding. "
  tag "fix": "To set the runtime status of the
\"net.ipv4.conf.all.accept_redirects\" kernel parameter, run the following
command:

# sysctl -w net.ipv4.conf.all.accept_redirects=0

If this is not the system's default value, add the following line to
\"/etc/sysctl.conf\":

net.ipv4.conf.all.accept_redirects = 0"

  describe kernel_parameter("net.ipv4.conf.all.accept_redirects") do
    its("value") { should_not be_nil }
  end
  describe kernel_parameter("net.ipv4.conf.all.accept_redirects") do
    its("value") { should eq 0 }
  end
  describe file("/etc/sysctl.conf") do
    its("content") { should match(/^[\s]*net.ipv4.conf.all.accept_redirects[\s]*=[\s]*0[\s]*$/) }
  end
end

