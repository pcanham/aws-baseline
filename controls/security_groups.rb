title 'AWS Security Group Recommendations'

control 'aws-secgrp-01' do
  impact 0.7
  title 'No security groups should be world-open on port 22'

  aws_security_groups.group_ids.each do |sg_id|
    describe aws_security_group(group_id: sg_id) do
      it { should_not allow_in(ipv4_range: '0.0.0.0/0', port: 22) }
    end
  end
end

control 'aws-secgrp-02' do
  impact 0.7
  title 'No security groups should be world-open on port 3389'
  
  aws_security_groups.group_ids.each do |sg_id|
    describe aws_security_group(group_id: sg_id) do
      it { should_not allow_in(ipv4_range: '0.0.0.0/0', port: 3389) }
    end
  end
end

control 'aws-secgrp-03' do
  impact 0.7
  title 'WinRM HTTP should not be world-open on 5985'
  
  aws_security_groups.group_ids.each do |sg_id|
    describe aws_security_group(group_id: sg_id) do
      it { should_not allow_in(ipv4_range: '0.0.0.0/0', port: 5985) }
    end
  end
end

control 'aws-secgrp-04' do
  impact 0.7
  title 'WinRM HTTPS should not be world-open on 5986'
  
  aws_security_groups.group_ids.each do |sg_id|
    describe aws_security_group(group_id: sg_id) do
      it { should_not allow_in(ipv4_range: '0.0.0.0/0', port: 5986) }
    end
  end
end
