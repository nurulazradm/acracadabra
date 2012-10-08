class ReportsController < ApplicationController

  skip_before_filter :verify_authenticity_token
  
  def create
    recipients = Rails.configuration.recipients
    logger.info "Recipients: " + recipients
    logger.info "Params: " + params.to_query
    ReportMailer.report(recipients, params)
    head :ok
  end

end
