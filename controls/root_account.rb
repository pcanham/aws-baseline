title 'AWS Root Account Recommendations'

control 'aws-root-account-01' do
  impact 10.0
  title 'Ensure MFA is enabled'

  describe aws_iam_root_user do
    it { should have_mfa_enabled }
  end
end

control 'aws-root-account-02' do
  impact 10.0
  title 'Ensure root account does not have access keys'

  describe aws_iam_root_user do
    it { should_not have_access_key }
  end
end
