class ReportsController < ApplicationController
  
  def create
    recipients = Rails.configuration.recipients
    logger.info "Recipients: " + recipients
    ReportMailer.report(recipients, params)
    head :ok
  end

end
