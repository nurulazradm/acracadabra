# Copyright (c) 2012 Livefront, Inc.  
# See the file license.txt for copying permission.

module WelcomeHelper
  def show_result(recipients)
    if recipients.blank?
      render partial: 'error'
    else
      render partial: 'success'
    end
  end
end
