title 'AWS IAM Recommendations'

control 'aws-iam-01' do
  impact 0.7
  title 'Look for old Access keys'

  describe aws_iam_access_keys.where { created_days_ago > 90 } do
    it { should_not exist }
  end
end

control 'aws-iam-02' do
  impact 0.7
  title 'Ensure Password policy is inplace'

  describe aws_iam_password_policy do
    it { should require_lowercase_characters }
    it { should require_uppercase_characters }
    it { should require_symbols }
    it { should require_numbers }
    its('minimum_password_length') { should be >= 8 }
  end
end
