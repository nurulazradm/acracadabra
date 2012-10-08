require "spec_helper"

describe ReportMailer do
  
  subject { ReportMailer }

  context 'report' do
    it 'should send an email with the report' do
      params = { APP_VERSION: '1.0', APP_PACKAGE: 'com.example' }
      subject.report('foo@bar.com', params).deliver
      email = ActionMailer::Base.deliveries.last
      email.to.should == ['foo@bar.com']
      email.subject.should include('Android App Crash')
      email.body.should include("APP_VERSION")
      email.body.should include("1.0")
      email.body.should include("APP_PACKAGE")
      email.body.should include("com.example")
    end
  end

end
