# Copyright (c) 2012 Livefront, Inc.  
# See the file license.txt for copying permission.

module WelcomeHelper
  def show_result(config)
    if config[:recipients].blank? || config[:from_address].blank?
      render partial: 'error'
    else
      render partial: 'success'
    end
  end
end
