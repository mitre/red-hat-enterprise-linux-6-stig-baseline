control "V-38628" do
  title "The operating system must produce audit records containing sufficient
information to establish the identity of any user/subject associated with the
event."
  desc  "Ensuring the \"auditd\" service is active ensures audit records
generated by the kernel can be written to disk, or that appropriate actions
will be taken if other obstacles exist."
  impact 0.5
  tag "gtitle": "SRG-OS-000255"
  tag "gid": "V-38628"
  tag "rid": "SV-50429r2_rule"
  tag "stig_id": "RHEL-06-000145"
  tag "fix_id": "F-43576r2_fix"
  tag "cci": ["CCI-001487"]
  tag "nist": ["AU-3", "Rev_4"]
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
  tag "check": "Run the following command to determine the current status of
the \"auditd\" service:

# service auditd status

If the service is enabled, it should return the following:

auditd is running...


If the service is not running, this is a finding."
  tag "fix": "The \"auditd\" service is an essential userspace component of the
Linux Auditing System, as it is responsible for writing audit records to disk.
The \"auditd\" service can be enabled with the following commands:

# chkconfig auditd on
# service auditd start"

  describe "Manual test" do
    skip "This control must be reviewed manually"
  end
end

