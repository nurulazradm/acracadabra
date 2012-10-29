# Copyright (c) 2012 Livefront, Inc.  
# See the file license.txt for copying permission.

class WelcomeController < ApplicationController
  def home
    from_address = Rails.configuration.from_address
    recipients = Rails.configuration.recipients
    @config = {from_address: from_address, recipients: recipients}
  end

  def not_found
    render file: "public/404.html", status: 404, layout: false
  end
end
