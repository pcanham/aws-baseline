title 'AWS Account Recommendations'

control 'aws-account-setup-01' do
  impact 0.7
  title 'Ensure Password policy is inplace'

  aws_iam_password_policy do
    it { should require_lowercase_characters }
    it { should require_uppercase_characters }
    it { should require_symbols }
    it { should require_numbers }
    its('minimum_password_length') { should be > 8 }
  end
end

control 'aws-account-setup-02' do
  impact 10.0
  title 'Ensure MFA is enabled'

  aws_iam_root_user do
    it { should have_mfa_enabled }
  end
end

control 'aws-account-setup-03' do
  impact 10.0
  title 'Ensure root account does not have access keys'

  aws_iam_root_user do
    it { should_not have_access_key }
  end
end
