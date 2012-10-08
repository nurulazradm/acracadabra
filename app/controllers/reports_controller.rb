class ReportsController < ApplicationController
  
  def create
    recipients = Rails.configuration.recipients
    ReportMailer.report(recipients, params)
    head :ok
  end

end
