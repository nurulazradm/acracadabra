# Copyright (c) 2012 Livefront, Inc.  
# See the file license.txt for copying permission.

class ReportMailer < ActionMailer::Base
  default from: Rails.configuration.from_address
  
  def report(email, report)
    @params = report
    mail(to: email, subject: 'Android App Crash')
  end
end
