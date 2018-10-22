title 'AWS IAM Recommendations'

control 'aws-iam-01' do
  impact 0.7
  title 'Look for old Access keys'

  describe aws_iam_access_keys.where { created_days_ago > 90 } do
    it { should_not exist }
  end
end

